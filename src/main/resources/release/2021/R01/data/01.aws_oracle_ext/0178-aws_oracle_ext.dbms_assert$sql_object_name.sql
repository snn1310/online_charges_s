CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_assert$sql_object_name(IN p_sql_object_name TEXT)
RETURNS TEXT
AS
$function$
DECLARE
    v_schema_name TEXT;
    v_object_name TEXT;
    v_obj_exists BOOLEAN;
BEGIN
    IF (coalesce(p_sql_object_name, '') ~ '^\s*$' OR -- Object name could not be blank (empty)
        p_sql_object_name ~ '^\s*\.|\.\s*$' OR -- Object name could not start or end with a dot
        array_length(string_to_array(p_sql_object_name, '\.'), 1) - 1 > 1) -- Object name could not contain more than one dot
    THEN
        RAISE invalid_name;
    END IF;

    -- Extracting schema name from object name literal
    v_schema_name := trim(coalesce(substring(p_sql_object_name, '^\s*(.+)\s*\.'), current_schema));

    -- Extracting object name from object_name literal
    v_object_name := trim(coalesce(substring(p_sql_object_name, '\.\s*(.+)'), p_sql_object_name));

    -- Preparing schema name
    IF (v_schema_name ~ '"') THEN
        -- All double quotes in the schema name must be paired
        IF (mod(array_length(string_to_array(v_schema_name, '"'), 1) - 1, 2) != 0) THEN
            RAISE invalid_name;
        END IF;

        v_schema_name := substring(v_schema_name, '"(.+)"');
    ELSIF (v_schema_name IS NOT NULL)
    THEN
        v_schema_name := lower(v_schema_name);
    END IF;

    -- Preparing object name
    IF (v_object_name ~ '"') THEN
        -- All double quotes in the object name must be paired
        IF (mod(array_length(string_to_array(v_object_name, '"'), 1) - 1, 2) != 0) THEN
            RAISE invalid_name;
        END IF;

        v_object_name := substring(v_object_name, '"(.+)"');
    ELSIF (v_object_name IS NOT NULL)
    THEN
        v_object_name := lower(v_object_name);
    END IF;

    v_obj_exists :=
        CASE
           WHEN EXISTS(SELECT 1 -- TABLE, VIEW
                         FROM information_schema.tables
                        WHERE table_schema = v_schema_name
                          AND table_name = v_object_name)
           THEN TRUE
           WHEN EXISTS(SELECT 1 -- INDEX
                         FROM pg_catalog.pg_class AS cls1
                              INNER JOIN pg_catalog.pg_index AS idx ON (idx.indexrelid = cls1.oid)
                              INNER JOIN pg_catalog.pg_class AS cls2 ON (cls2.oid = idx.indrelid)
                              LEFT JOIN pg_catalog.pg_user AS usr1 ON (usr1.usesysid = cls1.relowner)
                              LEFT JOIN pg_catalog.pg_user AS usr2 ON (usr2.usesysid = cls2.relowner)
                              LEFT JOIN pg_catalog.pg_namespace AS nsp1 ON (nsp1.oid = cls1.relnamespace)
                              LEFT JOIN pg_catalog.pg_namespace AS nsp2 ON (nsp2.oid = cls2.relnamespace)
                              INNER JOIN information_schema.tables AS tbl ON (tbl.table_schema = nsp2.nspname AND
                                                                              tbl.table_name = cls2.relname)
                        WHERE cls1.relkind = 'i'
                          AND nsp1.nspname = v_schema_name
                          AND cls1.relname = v_object_name)
           THEN TRUE
           WHEN EXISTS(SELECT 1 -- CONSTRAINT
                         FROM information_schema.table_constraints
                        WHERE constraint_schema = v_schema_name
                          AND constraint_name = v_object_name)
           THEN TRUE
           WHEN EXISTS(SELECT 1 -- SEQUENCE
                         FROM information_schema.sequences
                        WHERE sequence_schema = v_schema_name
                          AND sequence_name = v_object_name)
           THEN TRUE
           WHEN EXISTS(SELECT 1 -- FUNCTION, PROCEDURE
                         FROM information_schema.routines
                        WHERE routine_schema = v_schema_name
                          AND routine_name = v_object_name)
           THEN TRUE
           WHEN EXISTS(SELECT 1 -- TRIGGER
                         FROM information_schema.triggers
                        WHERE trigger_schema = v_schema_name
                          AND trigger_name = v_object_name)
           THEN TRUE
           WHEN EXISTS(SELECT 1 -- DOMAIN
                         FROM information_schema.domains
                        WHERE domain_schema = v_schema_name
                          AND domain_name = v_object_name)
           THEN TRUE
           WHEN EXISTS(SELECT 1 -- COMPOSITE TYPE, MATERIALIZED VIEW
                         FROM pg_catalog.pg_class AS cls
                              INNER JOIN pg_catalog.pg_namespace AS nsp ON (nsp.oid = cls.relnamespace)
                        WHERE cls.relkind IN ('c', 'm')
                          AND nsp.nspname = v_schema_name
                          AND cls.relname = v_object_name)
           THEN TRUE
           ELSE FALSE
        END;

    IF (NOT v_obj_exists) THEN
        RAISE invalid_name;
    END IF;

    RETURN p_sql_object_name;
EXCEPTION
    WHEN invalid_name THEN
        RAISE USING MESSAGE := 'Invalid object name.',
                    DETAIL := 'Input string literal is not a qualified SQL identifier of an existing SQL object.',
                    HINT := '-44002';
END;
$function$
LANGUAGE plpgsql;