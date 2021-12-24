CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_sql$init()
RETURNS VOID
AS
$function$
BEGIN
    -- Creating all necessary temp tables if they're not created before
    IF (NOT coalesce(nullif(current_setting('sct$dbms_sql.temp_tables_init', TRUE), ''), 'false')::BOOLEAN)
    THEN
        -- Explicit tables dropping, to remove existing ones
        DROP TABLE IF EXISTS dbms_sql$cursor_column CASCADE;

        DROP TABLE IF EXISTS dbms_sql$cursor CASCADE;
        
        DROP TABLE IF EXISTS dbms_sql$define_column;
        
        DROP TABLE IF EXISTS dbms_sql$bind_variable;

        DROP TABLE IF EXISTS dbms_sql$recordset;

        -- Temp table for storing cursor data (id, SQL statement etc.)
        CREATE TEMP TABLE dbms_sql$cursor (
            cursor_id INTEGER,
            sql_statement TEXT,
            colscount_block TEXT,
            colstype_block TEXT,
            prepdynsql_block TEXT,
            CONSTRAINT pk_cursor PRIMARY KEY (cursor_id)
        ) WITH (OIDS = FALSE)
        ON COMMIT PRESERVE ROWS;

        -- Temp table for storing defined columns data (position, data type etc.)
        CREATE TEMP TABLE dbms_sql$define_column (
            cursor_id INTEGER,
            column_pos INTEGER,
            data_type VARCHAR,
            base_type VARCHAR,
            col_size INTEGER,
            is_fixed SMALLINT,
            CONSTRAINT pk_def_column PRIMARY KEY (cursor_id, column_pos),
            CONSTRAINT fk_defcol_cursor FOREIGN KEY
               (cursor_id)
                REFERENCES dbms_sql$cursor (cursor_id) ON DELETE CASCADE
        ) WITH (OIDS = FALSE)
        ON COMMIT PRESERVE ROWS;

        -- Temp table for storing actual columns data (position, data type etc.)
        CREATE TEMP TABLE dbms_sql$cursor_column (
            cursor_id INTEGER,
            column_pos INTEGER,
            col_name VARCHAR,
            data_type VARCHAR,
            base_type VARCHAR,
            is_nullable BOOLEAN,
            chr_max_len INTEGER,
            chr_byte_len INTEGER,
            num_precision SMALLINT,
            num_scale SMALLINT,
            tstamp_precision SMALLINT,
            interval_type VARCHAR,
            interval_precision SMALLINT,
            CONSTRAINT pk_cur_column PRIMARY KEY (cursor_id, column_pos),
            CONSTRAINT fk_curcol_cursor FOREIGN KEY
               (cursor_id)
                REFERENCES dbms_sql$cursor (cursor_id) ON DELETE CASCADE
        ) WITH (OIDS = FALSE)
        ON COMMIT PRESERVE ROWS;

        -- Temp table for storing binded variables data (name, data type, value etc.)
        CREATE TEMP TABLE dbms_sql$bind_variable (
            cursor_id INTEGER,
            var_pos INTEGER,
            var_name VARCHAR,
            var_label VARCHAR,
            data_type VARCHAR,
            base_type VARCHAR,
            var_size INTEGER,
            value_size INTEGER,
            is_fixed SMALLINT,
            chr_val TEXT,
            num_val NUMERIC,
            dprec_val DOUBLE PRECISION,
            money_val MONEY,
            tstamp_val TIMESTAMP WITHOUT TIME ZONE,
            tstamptz_val TIMESTAMP WITH TIME ZONE,
            timetz_val TIME WITH TIME ZONE,
            interval_val INTERVAL,
            bool_val BOOLEAN,
            xml_val XML,
            bin_val BYTEA,
            CONSTRAINT pk_bind_var PRIMARY KEY (cursor_id, var_name),
            CONSTRAINT fk_bindvar_cur FOREIGN KEY
               (cursor_id)
                REFERENCES dbms_sql$cursor (cursor_id) ON DELETE CASCADE
        ) WITH (OIDS = FALSE)
        ON COMMIT PRESERVE ROWS;

        -- Temp table for storing dynamic statement execution results (parsed SQL record sets)
        CREATE TEMP TABLE dbms_sql$recordset (
            cursor_id INTEGER,
            rownum INTEGER,
            column_pos INTEGER,
            chr_val TEXT,
            num_val NUMERIC,
            dprec_val DOUBLE PRECISION,
            money_val MONEY,
            tstamp_val TIMESTAMP WITHOUT TIME ZONE,
            tstamptz_val TIMESTAMP WITH TIME ZONE,
            timetz_val TIME WITH TIME ZONE,
            interval_val INTERVAL,
            bool_val BOOLEAN,
            xml_val XML,
            bin_val BYTEA,
            CONSTRAINT pk_record_set PRIMARY KEY (cursor_id, rownum, column_pos),
            CONSTRAINT fk_recset_cursor FOREIGN KEY
               (cursor_id)
                REFERENCES dbms_sql$cursor (cursor_id) ON DELETE CASCADE,
            CONSTRAINT fk_recset_curcol FOREIGN KEY
               (cursor_id, column_pos)
                REFERENCES dbms_sql$cursor_column (cursor_id, column_pos)
        ) WITH (OIDS = FALSE)
        ON COMMIT PRESERVE ROWS;

        -- Marking package "dbms_sql" as initialized
        PERFORM set_config('sct$dbms_sql.temp_tables_init', 'true', FALSE);
    END IF;
EXCEPTION
    -- Effective userid (OID) changed
    WHEN insufficient_privilege THEN
        RAISE USING MESSAGE := 'DBMS_SQL access denied.',
                    DETAIL := 'DBMS_SQL access was denied due to security concerns.',
                    HINT := '-29471';
END;
$function$
LANGUAGE plpgsql
SET client_min_messages TO WARNING;