CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_sql$open_cursor(IN p_security_level INTEGER DEFAULT 1)
RETURNS NUMERIC
AS
$function$
DECLARE
    v_cursor_id INTEGER;
    v_security_level SMALLINT;
BEGIN
    -- Security level is 1 when passed NULL
    v_security_level := coalesce(p_security_level, 1);

    -- Checking that security level lies into valid range
    IF (v_security_level NOT BETWEEN 0 AND 2) THEN
        RAISE numeric_value_out_of_range;
    END IF;

    -- Checking security level for allowed values
    IF (v_security_level = 0) THEN
        RAISE invalid_parameter_value;
    END IF;

    -- Initializing solution temp tables
    PERFORM aws_oracle_ext.dbms_sql$init();

    -- Generating unpredictable, randomized, cursor number
    WHILE (v_cursor_id IS NULL)
    LOOP
        BEGIN
            INSERT INTO dbms_sql$cursor (cursor_id)
                 VALUES (aws_oracle_ext.dbms_random$random())
              RETURNING cursor_id
                   INTO v_cursor_id;
        EXCEPTION
            WHEN insufficient_privilege THEN
                -- Effective userid changed
                RAISE invalid_role_specification;
            WHEN unique_violation THEN
            NULL;
        END;
    END LOOP;

    -- Saving cursor metadata (JSON) object
    PERFORM set_config(format('sct$dbms_sql.cursor_id_%s_metadata', v_cursor_id),
                       jsonb_build_object('cursor_id', v_cursor_id,
                                          'security_level', v_security_level,
                                          'from_refcursor', FALSE)::TEXT,
                       FALSE);

    -- Nulling `last_cursor_func_code` variable
    PERFORM set_config('sct$dbms_sql.last_cursor_func_code', NULL, FALSE);

    -- Setting `last_opened_cursor_id` variable
    PERFORM set_config('sct$dbms_sql.last_opened_cursor_id', v_cursor_id::TEXT, FALSE);

    -- Setting `last_affected_cursor_id` variable
    PERFORM set_config('sct$dbms_sql.last_affected_cursor_id', v_cursor_id::TEXT, FALSE);

    -- Nulling `last_row_count` variable
    PERFORM set_config('sct$dbms_sql.last_row_count', NULL, FALSE);

    RETURN v_cursor_id;
EXCEPTION
    -- Incorrect security level value
    WHEN numeric_value_out_of_range THEN
        RAISE USING MESSAGE := 'Security level is outside the valid range of 0 to 2.',
                    DETAIL := 'An invalid security level value was specified.',
                    HINT := '-29472';

    -- Disabled security level value
    WHEN invalid_parameter_value THEN
        RAISE USING MESSAGE := 'Security level of 0 is not allowed.',
                    DETAIL := 'This level of security is disabled by default.',
                    HINT := '-29474';

    -- Effective userid (OID) changed since solution initialization
    WHEN invalid_role_specification THEN
        RAISE USING MESSAGE := 'DBMS_SQL access denied.',
                    DETAIL := 'DBMS_SQL access was denied due to security concerns.',
                    HINT := '-29471';
END;
$function$
LANGUAGE plpgsql;