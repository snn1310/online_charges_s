CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_utility$format_call_stack(IN p_ora_style BOOLEAN DEFAULT FALSE)
RETURNS TEXT
AS
$function$
DECLARE
    v_server_pid TEXT;
    v_obj_handle TEXT;
    v_schema_name TEXT;
    v_routine_name TEXT;
    v_routine_type TEXT;
    v_routine_oid TEXT;
    i_param_type TEXT;
    v_call_stack TEXT[];
    v_call_info TEXT[];
    v_param_types TEXT;
    v_stack_header TEXT;
    v_search_path TEXT[];
    v_pg_call_stack TEXT;
    v_anonymous_block TEXT;
    v_call_stack_rec TEXT;
    v_full_search_path TEXT[];
    i_call_stack_rec RECORD;
BEGIN
    -- Determining call stack label depending on Oracle style param
    v_stack_header := CASE
                         WHEN p_ora_style THEN '------- PL/SQL Call Stack -------'
                         ELSE '------ PL/pgSQL Call Stack ------'
                      END;

    -- Determining anonymous block label depending on Oracle style param
    v_anonymous_block := CASE
                            WHEN p_ora_style THEN 'anonymous block'
                            ELSE 'inline_code_block'
                         END;

    -- Constructing call stack header
    v_call_stack := ARRAY[v_stack_header,
                          '    object       line  object',
                          '    handle     number  name'];

    -- Obtaining current search path
    v_search_path := regexp_split_to_array(replace(current_setting('search_path'),
                                                   '$user', current_user), '\s*,\s*');
    -- Getting server process ID
    v_server_pid = pg_backend_pid();

    -- Getting current call stack
    GET DIAGNOSTICS v_pg_call_stack = PG_CONTEXT;

    FOR i_call_stack_rec IN
    (SELECT t.*
       FROM regexp_split_to_table(v_pg_call_stack, chr(10))
       WITH ORDINALITY AS t(call_stack, line_num))
    LOOP
        CONTINUE WHEN i_call_stack_rec.line_num = 1 OR
                      i_call_stack_rec.call_stack !~ 'line \d+ at';

        -- Obtaining info regarding particular stack call
        v_call_info := regexp_matches(i_call_stack_rec.call_stack,
                                      '^[[:alnum:]_/]+\s+([a-z]+)\s+(.*)(?<=[^\s])\s+line\s+(\d+)', 'g');
        v_routine_oid := NULL;

        v_routine_type := v_call_info[1];

        -- Extracting param types list from routine signature
        v_param_types := substring(v_call_info[2], '\((.*)\)$');

        -- Extracting schema name from `schema.["]routine["]`
        v_schema_name := substring(v_call_info[2], '^(.+)\.');

        -- Extracting routine name from `schema.["]routine["]`(params)
        v_routine_name := regexp_replace(v_call_info[2], '^(.+)\.|\((.*)\)$', '', 'g');

        -- Emulating Oracle anonymous block label
        IF (p_ora_style) THEN
            v_routine_name := replace(v_routine_name, 'inline_code_block', 'anonymous block');
        END IF;

        -- Determining whether call routine is a function or a procedure
        IF (v_routine_type = 'function' AND v_routine_name != 'anonymous block')
        THEN
            -- Putting stack record schema name on top of search path
            v_full_search_path := CASE
                                     WHEN v_schema_name IS NULL THEN v_search_path
                                     ELSE array_prepend(v_schema_name, v_search_path)
                                  END;
            SELECT oid,
                   CASE prokind
                      WHEN 'p' THEN 'procedure'
                      ELSE 'function'
                   END,
                   pronamespace::REGNAMESPACE::TEXT
              INTO v_routine_oid,
                   v_routine_type,
                   v_schema_name
              FROM pg_catalog.pg_proc
             WHERE proname = substring(v_routine_name, '"?([^"]+)') -- routine name
               AND pronamespace::REGNAMESPACE::TEXT = ANY(v_full_search_path) -- schema names list
               AND proargtypes = coalesce(array_to_string(string_to_array(v_param_types, ',')::REGTYPE[]::OID[],
                                          ' '), '')::OIDVECTOR -- param OIDs list
             ORDER BY array_position(v_full_search_path, pronamespace::REGNAMESPACE::TEXT) ASC
             LIMIT 1;
        END IF;

        -- Constructing object handle (server_PID.object_OID)
        v_obj_handle := concat(v_server_pid, '.' || v_routine_oid);

        -- Constructing call stack record
        v_call_stack_rec :=
            concat(rpad(repeat(' ', (14 - char_length(v_obj_handle)) / 2) || v_obj_handle, 14), -- object handle
                   ' ', -- delimiter
                   lpad(v_call_info[3], 6, ' '), -- line number
                   '  ', -- delimiter
                   CASE
                      WHEN v_routine_name !~ '^(anonymous\s|inline_code_)block$'
                      THEN v_routine_type || ' ' -- routine type
                   END,
                   CASE
                      WHEN v_schema_name ~ '^"' THEN v_schema_name
                      ELSE CASE
                              WHEN p_ora_style THEN upper(v_schema_name)
                              ELSE v_schema_name
                           END
                   END || '.', -- schema name
                   CASE
                      WHEN v_routine_name ~ '^"' OR
                           v_routine_name ~ '^(anonymous\s|inline_code_)block$'
                      THEN v_routine_name
                      ELSE CASE
                              WHEN p_ora_style THEN upper(v_routine_name)
                              ELSE v_routine_name
                           END
                   END, -- routine name
                   CASE
                      WHEN v_routine_name !~ '^(anonymous\s|inline_code_)block$'
                      THEN CASE
                              WHEN NOT p_ora_style THEN concat('(', v_param_types, ')')
                              ELSE upper('(' || nullif(v_param_types, '') || ')')
                           END
                   END);

        v_call_stack := array_append(v_call_stack, v_call_stack_rec);
    END LOOP;

    -- SQL SELECT dbms_utility$format_call_stack()
    IF (array_length(v_call_stack, 1) = 3) THEN
        v_call_stack :=
            array_append(v_call_stack,
                         rpad(repeat(' ', (14 - char_length(v_server_pid)) / 2) || v_server_pid, 14)
                         || '      1  '
                         || v_anonymous_block);
    END IF;

    RETURN array_to_string(v_call_stack, chr(10));
END;
$function$
LANGUAGE plpgsql;