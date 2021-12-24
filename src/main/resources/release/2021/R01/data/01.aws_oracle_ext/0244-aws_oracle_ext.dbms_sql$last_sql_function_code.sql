CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_sql$last_sql_function_code(IN p_cursor_id INTEGER DEFAULT NULL)
RETURNS NUMERIC
AS
$BODY$
DECLARE
    v_cursor_id INTEGER;
    v_sql_statement TEXT;
    v_cur_metadata JSONB;
    v_actual_cursor_id INTEGER;
    v_function_code INTEGER := 0;
    v_last_parsed_cur_id INTEGER;
    v_last_opened_cur_id INTEGER;
    v_last_cursor_func_code NUMERIC;
BEGIN
    -- Getting the most recently parsed cursor id
    v_last_parsed_cur_id := nullif(current_setting('sct$dbms_sql.last_parsed_cursor_id', TRUE), '');

    -- Getting the most recently opened cursor id
    v_last_opened_cur_id := coalesce(nullif(current_setting('sct$dbms_sql.last_opened_cursor_id', TRUE), '')::INTEGER, 0);

    -- Recently opened cursor id is preferred over the last parsed one
    v_actual_cursor_id := greatest(v_last_opened_cur_id, v_last_parsed_cur_id);

    -- Getting last parsed (opened) cursor metadata (JSON) object
    v_cur_metadata := nullif(current_setting(format('sct$dbms_sql.cursor_id_%s_metadata', v_actual_cursor_id), TRUE), '');

    -- Getting `last_cursor_func_code` variable
    v_last_cursor_func_code := nullif(current_setting('sct$dbms_sql.last_cursor_func_code', TRUE), '');

    IF (p_cursor_id IS NULL AND
        v_cur_metadata IS NULL AND
        v_last_cursor_func_code IS NOT NULL)
    THEN
        RETURN v_last_cursor_func_code;
    ELSE
        v_cursor_id := coalesce(p_cursor_id, v_actual_cursor_id);
    END IF;

    /* If the cursor is not opened,
       exit the function with code 0 */
    IF (NOT aws_oracle_ext.dbms_sql$is_open(v_cursor_id)) THEN
        RETURN v_function_code;
    END IF;

    -- Getting SQL-PL/pgSQL statement by cursor id
    SELECT sql_statement
      INTO v_sql_statement
      FROM dbms_sql$cursor
     WHERE cursor_id = v_cursor_id;

    /* See list of possible function codes here:
       https://docstore.mik.ua/orelly/oracle/bipack/ch02_03.htm
    */
    IF (v_sql_statement ~* '^\s*(CREATE\s+(?:(?:GLOBAL\s+)|(?:LOCAL\s+))?TEMPORARY\s+TABLE\s+)|(CREATE\s+(?:(?:GLOBAL\s+)|(?:LOCAL\s+))?TEMP\s+TABLE\s+)|(CREATE\s+(?:UNLOGGED\s+)?TABLE\s+)')
    THEN -- CREATE TABLE
        v_function_code := 1;
    ELSIF (v_sql_statement ~* '^\s*(SET\s+ROLE)\s+')
    THEN -- SET ROLE
        v_function_code := 2;
    ELSIF (v_sql_statement ~* '^\s*INSERT\s+INTO\s+')
    THEN -- INSERT INTO
        v_function_code := 3;
    ELSIF (v_sql_statement ~* '^\s*(SELECT)\s+' AND v_sql_statement !~* '^SELECT(.)*INTO\s*([\$\:][[:alnum:]_$#\.]+(,\s*)?)+\s*;?$')
    THEN -- SELECT
        v_function_code := 4;
    ELSIF (v_sql_statement ~* '^\s*(UPDATE)\s+')
    THEN -- UPDATE
        v_function_code := 5;
    ELSIF (v_sql_statement ~* '^\s*MERGE\s+INTO\s+')
    THEN -- MERGE
        v_function_code := 189;
    ELSIF (v_sql_statement ~* '^\s*(DROP\s+ROLE)\s+')
    THEN -- DROP ROLE
        v_function_code := 6;
    ELSIF (v_sql_statement ~* '^\s*(DROP\s+VIEW)\s+')
    THEN -- DROP VIEW
        v_function_code := 7;
    ELSIF (v_sql_statement ~* '^\s*(DROP\s+TABLE\s+)')
    THEN -- DROP TABLE
        v_function_code := 8;
    ELSIF (v_sql_statement ~* '^\s*(DELETE)\s+')
    THEN -- DELETE
        v_function_code := 9;
    ELSIF (v_sql_statement ~* '^\s*(CREATE\s+(?:OR\s+REPLACE\s+)?(?:TEMP\s+)?(?:TEMPORARY\s+)?VIEW)\s+')
    THEN -- CREATE (OR REPLACE) (TEMPORARY | TEMP) VIEW
        v_function_code := 10;
    ELSIF (v_sql_statement ~* '^\s*(DROP\s+USER)\s+|(DROP\s+SCHEMA)\s+')
    THEN -- DROP USER
        v_function_code := 11;
    ELSIF (v_sql_statement ~* '^\s*(CREATE\s+ROLE)\s+')
    THEN -- CREATE ROLE
        v_function_code := 12;
    ELSIF (v_sql_statement ~* '^\s*(CREATE\s+(?:TEMPORARY\s+)?SEQUENCE)|(CREATE\s+(?:TEMP\s+)?SEQUENCE)\s+')
    THEN -- CREATE (TEMPORARY | TEMP) SEQUENCE
        v_function_code := 13;
    ELSIF (v_sql_statement ~* '^\s*(ALTER\s+SEQUENCE)\s+')
    THEN -- ALTER SEQUENCE
        v_function_code := 14;
    ELSIF (v_sql_statement ~* '^\s*(DROP\s+SEQUENCE)\s+')
    THEN -- DROP SEQUENCE
        v_function_code := 16;
    ELSIF (v_sql_statement ~* '^\s*(CREATE\s+CLUSTER)\s+')
    THEN -- CREATE CLUSTER
        v_function_code := 18;
    ELSIF (v_sql_statement ~* '^\s*CREATE\s+(USER|SCHEMA)\s+')
    THEN -- CREATE USER
        v_function_code := 19;
    ELSIF (v_sql_statement ~* '^\s*(CREATE\s+(?:UNIQUE\s+)?INDEX)|(CREATE\s+(?:BITMAP\s+)?INDEX)\s+')
    THEN -- CREATE INDEX
        v_function_code := 20;
    ELSIF (v_sql_statement ~* '^\s*(DROP\s+INDEX)\s+')
    THEN -- DROP INDEX
        v_function_code := 21;
    ELSIF (v_sql_statement ~* '^\s*(DROP\s+CLUSTER)\s+')
    THEN -- DROP CLUSTER
        v_function_code := 22;
    ELSIF (v_sql_statement ~* '^\s*(CREATE\s+(?:OR\s+REPLACE\s+)?PROCEDURE)\s+')
    THEN -- CREATE (OR REPLACE) PROCEDURE
        v_function_code := 24;
    ELSIF (v_sql_statement ~* '^\s*(ALTER\s+PROCEDURE)\s+')
    THEN -- ALTER PROCEDURE
        v_function_code := 25;
    ELSIF (v_sql_statement ~* '^\s*(ALTER\s+TABLE\s+)')
    THEN -- ALTER TABLE
        v_function_code := 26;
    ELSIF (v_sql_statement ~* '^\s*EXPLAIN\s+')
    THEN -- EXPLAIN
        v_function_code := 27;
    ELSIF (v_sql_statement ~* '^\s*(GRANT)\s+')
    THEN -- GRANT
        v_function_code := 28;
    ELSIF (v_sql_statement ~* '^\s*(REVOKE)\s+')
    THEN -- REVOKE
        v_function_code := 29;
    ELSIF (v_sql_statement ~* '^\s*(CREATE\s+(?:OR\s+REPLACE\s+)?(?:PUBLIC\s+)?SYNONYM)\s+')
    THEN -- CREATE (OR REPLACE) (PUBLIC) SYNONYM
        v_function_code := 30;
    ELSIF (v_sql_statement ~* '^\s*(DROP\s+(?:PUBLIC\s+)?SYNONYM)\s+')
    THEN -- DROP (PUBLIC) SYNONYM
        v_function_code := 31;
    ELSIF (v_sql_statement ~* '^\s*(ALTER\s+SYSTEM)\s+')
    THEN -- ALTER SYSTEM
        v_function_code := 32;
    ELSIF (v_sql_statement ~* '^\s*(SET\s+TRANSACTION)\s+')
    THEN -- SET TRANSACTION
        v_function_code := 33;
    ELSIF (v_sql_statement ~* '^\s*SET\s+CONSTRAINT[S]?\s+')
    THEN -- SET CONSTRAINTS
        v_function_code := 90;
    ELSIF (v_sql_statement ~* '(^\s*(?:<<.+>>)?\s*(BEGIN|DECLARE)\s+)|(^\s*DO(:?\s+LANGUAGE\s+[[:alpha:]]+\s+)?\s*\$([[:alnum:]_]*)?\$\s*(:<<.+>>)?\s*)' OR
           v_sql_statement ~* '^SELECT(.)*INTO\s*([\$\:][[:alnum:]_$#\.]+(,\s*)?)+\s*;?$')
    THEN -- PL/SQL EXECUTE
        v_function_code := 34;
    ELSIF (v_sql_statement ~* '^\s*LOCK\s+')
    THEN -- LOCK
        v_function_code := 35;
    ELSIF (v_sql_statement ~* '^\s*RENAME\s+')
    THEN -- RENAME
        v_function_code := 37;
    ELSIF (v_sql_statement ~* '^\s*(COMMENT\s+ON)\s+')
    THEN -- COMMENT
        v_function_code := 38;
    ELSIF (v_sql_statement ~* '^\s*AUDIT\s+')
    THEN -- AUDIT
        v_function_code := 39;
    ELSIF (v_sql_statement ~* '^\s*NOAUDIT\s+')
    THEN -- NOAUDIT
        v_function_code := 40;
    ELSIF (v_sql_statement ~* '^\s*(ALTER\s+INDEX)\s+')
    THEN -- ALTER INDEX
        v_function_code := 41;
    ELSIF (v_sql_statement ~* '^\s*(CREATE\s+DATABASE)\s+')
    THEN -- CREATE DATABASE
        v_function_code := 44;
    ELSIF (v_sql_statement ~* '^\s*(ALTER\s+DATABASE)\s+')
    THEN -- ALTER DATABASE
        v_function_code := 45;
    ELSIF (v_sql_statement ~* '^\s*(CREATE\s+(?:PUBLIC\s+)?ROLLBACK\s+SEGMENT)\s+')
    THEN -- CREATE (OR REPLACE) (PUBLIC) ROLLBACK SEGMENT
        v_function_code := 46;
    ELSIF (v_sql_statement ~* '^\s*(ALTER\s+ROLLBACK\s+SEGMENT)\s+')
    THEN -- ALTER ROLLBACK SEGMENT
        v_function_code := 47;
    ELSIF (v_sql_statement ~* '^\s*(DROP\s+ROLLBACK\s+SEGMENT)\s+')
    THEN -- DROP ROLLBACK SEGMENT
        v_function_code := 48;
    ELSIF (v_sql_statement ~* '^\s*(CREATE\s+(?:(?:SMALLFILE\s+)|(?:BIGFILE\s+)|(?:UNDO\s+)|(?:TEMPORARY\s+))?TABLESPACE)\s+')
    THEN -- CREATE (SMALLFILE | BIGFILE | UNDO | TEMPORARY) TABLESPACE
        v_function_code := 49;
    ELSIF (v_sql_statement ~* '^\s*(ALTER\s+TABLESPACE)\s+')
    THEN -- ALTER TABLESPACE
        v_function_code := 50;
    ELSIF (v_sql_statement ~* '^\s*(DROP\s+TABLESPACE)\s+')
    THEN -- DROP TABLESPACE
        v_function_code := 51;
    ELSIF (v_sql_statement ~* '^\s*ALTER\s+SESSION\s+|^\s*RESET\s+' OR
           (v_sql_statement ~* '^\s*SET\s+[[:alnum:]_$#]+\s+' AND v_sql_statement !~* '^\s*SET\s+LOCAL\s+'))
    THEN -- ALTER SESSION
        v_function_code := 52;
    ELSIF (v_sql_statement ~* '^\s*(ALTER\s+USER)\s+|(ALTER\s+SCHEMA)\s+')
    THEN -- ALTER USER
        v_function_code := 53;
    ELSIF (v_sql_statement ~* '^\s*COMMIT(?:\s+WORK)?\s*$')
    THEN -- COMMIT[ WORK]
        v_function_code := 54;
    ELSIF (v_sql_statement ~* '^\s*ROLLBACK(?:\s+WORK)?\s*$')
    THEN -- ROLLBACK[ WORK]
        v_function_code := 55;
    ELSIF (v_sql_statement ~* '^\s*SAVEPOINT\s+')
    THEN -- SAVEPOINT
        v_function_code := 56;
    ELSIF (v_sql_statement ~* '^\s*(CREATE\s+CONTROLFILE)\s+')
    THEN -- CREATE CONTROL FILE
        v_function_code := 57;
    ELSIF (v_sql_statement ~* '^\s*(CREATE\s+(?:OR\s+REPLACE\s+)?(?:CONSTRAINT\s+)?TRIGGER)\s+')
    THEN -- CREATE TRIGGER
        v_function_code := 59;
    ELSIF (v_sql_statement ~* '^\s*(ALTER\s+TRIGGER)\s+')
    THEN -- ALTER TRIGGER
        v_function_code := 60;
    ELSIF (v_sql_statement ~* '^\s*(DROP\s+TRIGGER)\s+')
    THEN -- DROP TRIGGER
        v_function_code := 61;
    ELSIF (v_sql_statement ~* '^\s*ANALYZE\s+TABLE\s+')
    THEN -- ANALYZE TABLE
        v_function_code := 62;
    ELSIF (v_sql_statement ~* '^\s*ANALYZE\s+INDEX\s+')
    THEN -- ANALYZE INDEX
        v_function_code := 63;
    ELSIF (v_sql_statement ~* '^\s*ANALYZE\s+CLUSTER\s+')
    THEN -- ANALYZE CLUSTER
        v_function_code := 64;
    ELSIF (v_sql_statement ~* '^\s*(CREATE\s+PROFILE)\s+')
    THEN -- CREATE PROFILE
        v_function_code := 65;
    ELSIF (v_sql_statement ~* '^\s*(DROP\s+PROFILE)\s+')
    THEN -- DROP PROFILE
        v_function_code := 66;
    ELSIF (v_sql_statement ~* '^\s*(ALTER\s+PROFILE)\s+')
    THEN -- ALTER PROFILE
        v_function_code := 67;
    ELSIF (v_sql_statement ~* '^\s*(DROP\s+PROCEDURE)\s+')
    THEN -- DROP PROCEDURE
        v_function_code := 68;
    ELSIF (v_sql_statement ~* '^\s*(ALTER\s+RESOURCE\s+COST)\s+')
    THEN -- ALTER RESOURCE COST
        v_function_code := 70;
    ELSIF (v_sql_statement ~* '^\s*(CREATE\s+(MATERIALIZED\s+VIEW|SNAPSHOT)\s+LOG\s+ON)\s+')
    THEN -- CREATE SNAPSHOT LOG
        v_function_code := 71;
    ELSIF (v_sql_statement ~* '^\s*(ALTER\s+(MATERIALIZED\s+VIEW|SNAPSHOT)\s+LOG\s+ON)\s+')
    THEN -- ALTER SNAPSHOT LOG
        v_function_code := 72;
    ELSIF (v_sql_statement ~* '^\s*(DROP\s+(MATERIALIZED\s+VIEW|SNAPSHOT)\s+LOG\s+ON)\s+')
    THEN -- DROP SNAPSHOT LOG
        v_function_code := 73;
    ELSIF (v_sql_statement ~* '^\s*(CREATE\s+(MATERIALIZED\s+VIEW|SNAPSHOT))\s+')
    THEN -- CREATE SNAPSHOT
        v_function_code := 74;
    ELSIF (v_sql_statement ~* '^\s*(ALTER\s+(MATERIALIZED\s+VIEW|SNAPSHOT))\s+')
    THEN -- ALTER SNAPSHOT
        v_function_code := 75;
    ELSIF (v_sql_statement ~* '^\s*(DROP\s+(MATERIALIZED\s+VIEW|SNAPSHOT))\s+')
    THEN -- DROP SNAPSHOT
        v_function_code := 76;
    ELSIF (v_sql_statement ~* '^\s*(CREATE\s+(?:OR\s+REPLACE\s+)?TYPE)\s+(?!BODY)')
    THEN -- CREATE[ OR REPLACE] TYPE
        v_function_code := 77;
    ELSIF (v_sql_statement ~* '^\s*(DROP\s+TYPE)\s+(?!BODY)')
    THEN -- DROP TYPE
        v_function_code := 78;
    ELSIF (v_sql_statement ~* '^\s*(ALTER\s+ROLE)\s+')
    THEN -- ALTER ROLE
        v_function_code := 79;
    ELSIF (v_sql_statement ~* '^\s*(ALTER\s+TYPE)\s+' AND v_sql_statement !~* 'BODY')
    THEN -- ALTER TYPE
        v_function_code := 80;
    ELSIF (v_sql_statement ~* '^\s*(CREATE\s+(?:OR\s+REPLACE\s+)?TYPE\s+BODY)\s+')
    THEN -- CREATE[ OR REPLACE] TYPE BODY
        v_function_code := 81;
    ELSIF (v_sql_statement ~* '^\s*(ALTER\s+TYPE\s+(?:.)*\s+COMPILE\s+(?:DEBUG\s+)?BODY)')
    THEN -- ALTER TYPE COMPILE (DEBUG) BODY
        v_function_code := 82;
    ELSIF (v_sql_statement ~* '^\s*(DROP\s+TYPE\s+BODY)\s+')
    THEN -- DROP TYPE BODY
        v_function_code := 83;
    ELSIF (v_sql_statement ~* '^\s*(DROP\s+LIBRARY)\s+')
    THEN -- DROP LIBRARY
        v_function_code := 84;
    ELSIF (v_sql_statement ~* '^\s*(TRUNCATE\s+TABLE)\s+')
    THEN -- TRUNCATE TABLE
        v_function_code := 85;
    ELSIF (v_sql_statement ~* '^\s*(TRUNCATE\s+CLUSTER)\s+')
    THEN -- TRUNCATE CLUSTER
        v_function_code := 86;
    ELSIF (v_sql_statement ~* '^\s*(CREATE\s+BITMAPFILE)\s+')
    THEN -- CREATE BITMAPFILE
        v_function_code := 87;
    ELSIF (v_sql_statement ~* '^\s*(ALTER\s+VIEW)\s+')
    THEN -- ALTER VIEW
        v_function_code := 88;
    ELSIF (v_sql_statement ~* '^\s*(DROP\s+BITMAPFILE)\s+')
    THEN -- DROP BITMAPFILE
        v_function_code := 89;
    ELSIF (v_sql_statement ~* '^\s*(CREATE\s+(?:OR\s+REPLACE\s+)?FUNCTION\s+(?:.)*(RETURN|RETURNS))\s+')
    THEN -- CREATE (OR REPLACE) FUNCTION
        v_function_code := 91;
    ELSIF (v_sql_statement ~* '^\s*(ALTER\s+FUNCTION)\s+')
    THEN -- ALTER FUNCTION
        v_function_code := 92;
    ELSIF (v_sql_statement ~* '^\s*(DROP\s+FUNCTION)\s+')
    THEN -- DROP FUNCTION
        v_function_code := 93;
    ELSIF (v_sql_statement ~* '^\s*(CREATE\s+(?:OR\s+REPLACE\s+)?PACKAGE)\s+' AND v_sql_statement !~* 'BODY')
    THEN -- CREATE (OR REPLACE) PACKAGE
        v_function_code := 94;
    ELSIF (v_sql_statement ~* '^\s*(ALTER\s+PACKAGE)\s+' AND v_sql_statement !~* 'BODY')
    THEN -- ALTER PACKAGE
        v_function_code := 95;
    ELSIF (v_sql_statement ~* '^\s*(DROP\s+PACKAGE)\s+' AND v_sql_statement !~* 'BODY')
    THEN -- DROP PACKAGE
        v_function_code := 96;
    ELSIF (v_sql_statement ~* '^\s*(CREATE\s+(?:OR\s+REPLACE\s+)?PACKAGE\s+BODY)\s+')
    THEN -- CREATE (OR REPLACE) PACKAGE BODY
        v_function_code := 97;
    ELSIF (v_sql_statement ~* '^\s*(ALTER\s+PACKAGE)\s+' AND v_sql_statement ~* 'BODY')
    THEN -- ALTER PACKAGE BODY
        v_function_code := 98;
    ELSIF (v_sql_statement ~* '^\s*(DROP\s+PACKAGE\s+BODY)\s+')
    THEN -- DROP PACKAGE BODY
        v_function_code := 99;
    ELSIF (v_sql_statement ~* '^\s*(CREATE\s+(?:OR\s+REPLACE\s+)?DIRECTORY)\s+')
    THEN -- CREATE (OR REPLACE) DIRECTORY
        v_function_code := 157;
    ELSIF (v_sql_statement ~* '^\s*(DROP\s+DIRECTORY)\s+')
    THEN -- DROP DIRECTORY
        v_function_code := 158;
    ELSIF (v_sql_statement ~* '^\s*(CREATE\s+(?:OR\s+REPLACE\s+)?LIBRARY)\s+')
    THEN -- CREATE (OR REPLACE) LIBRARY
        v_function_code := 159;
    ELSIF (v_sql_statement ~* '^\s*CALL\s+')
    THEN -- CALL METHOD
        v_function_code := 170;
    ELSIF (v_sql_statement ~* '^\s*PURGE\s+RECYCLEBIN\s*[;]?\s*$')
    THEN -- PURGE RECYCLEBIN
        v_function_code := 197;
    ELSIF (v_sql_statement ~* '^\s*PURGE\s+DBA_RECYCLEBIN\s*[;]?\s*$')
    THEN -- PURGE DBA_RECYCLEBIN
        v_function_code := 198;
    ELSIF (v_sql_statement ~* '^\s*PURGE\s+TABLESPACE\s+')
    THEN -- PURGE TABLESPACE
        v_function_code := 199;
    ELSIF (v_sql_statement ~* '^\s*PURGE\s+TABLE\s+')
    THEN -- PURGE TABLE
        v_function_code := 200;
    ELSIF (v_sql_statement ~* '^\s*PURGE\s+INDEX\s+')
    THEN -- PURGE INDEX
        v_function_code := 201;
    ELSIF (v_sql_statement ~* '^\s*FLASHBACK\s+.*\s+BEFORE\s+DROP')
    THEN -- UNDROP (FLASHBACK)
        v_function_code := 202;
    ELSIF (v_sql_statement ~* '^\s*DROP\s+DATABASE\s*[;]?\s*')
    THEN -- DROP DATABASE
        v_function_code := 203;
    ELSIF (v_sql_statement ~* '^\s*CREATE\s+(?:OR\s+REPLACE\s+)?ATTRIBUTE\s+DIMENSION\s+')
    THEN -- CREATE[ OR REPLACE] ATTRIBUTE DIMENSION
        v_function_code := 243;
    ELSIF (v_sql_statement ~* '^\s*ALTER\s+ATTRIBUTE\s+DIMENSION\s+')
    THEN -- ALTER ATTRIBUTE DIMENSION
        v_function_code := 244;
    ELSIF (v_sql_statement ~* '^\s*DROP\s+ATTRIBUTE\s+DIMENSION\s+')
    THEN -- DROP ATTRIBUTE DIMENSION
        v_function_code := 245;
    ELSIF (v_sql_statement ~* '^\s*CREATE\s+(?:OR\s+REPLACE\s+)?HIERARCHY\s+')
    THEN -- CREATE[ OR REPLACE] HIERARCHY
        v_function_code := 246;
    ELSIF (v_sql_statement ~* '^\s*ALTER\s+HIERARCHY\s+')
    THEN -- ALTER HIERARCHY
        v_function_code := 247;
    ELSIF (v_sql_statement ~* '^\s*DROP\s+HIERARCHY\s+')
    THEN -- DROP HIERARCHY
        v_function_code := 248;
    ELSIF (v_sql_statement ~* '^\s*CREATE\s+(?:OR\s+REPLACE\s+)?ANALYTIC\s+VIEW\s+')
    THEN -- CREATE[ OR REPLACE] ANALYTIC VIEW
        v_function_code := 249;
    ELSIF (v_sql_statement ~* '^\s*ALTER\s+ANALYTIC\s+VIEW\s+')
    THEN -- ALTER ANALYTIC VIEW
        v_function_code := 250;
    ELSIF (v_sql_statement ~* '^\s*DROP\s+ANALYTIC\s+VIEW\s+')
    THEN -- DROP ANALYTIC VIEW
        v_function_code := 251;
    END IF;

    IF (p_cursor_id IS NULL) THEN
        -- Setting `last_cursor_func_code` variable
        PERFORM set_config('sct$dbms_sql.last_cursor_func_code', v_function_code::TEXT, FALSE);
    END IF;

    RETURN v_function_code;
EXCEPTION
    -- Effective userid (OID) changed since cursor parse
    WHEN insufficient_privilege THEN
        RAISE USING MESSAGE := 'DBMS_SQL access denied.',
                    DETAIL := 'DBMS_SQL access was denied due to security concerns.',
                    HINT := '-29471';
END;
$BODY$
LANGUAGE plpgsql
STABLE;