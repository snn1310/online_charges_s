CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_sql$last_row_count()
RETURNS NUMERIC
AS
$function$
DECLARE
    v_field_name VARCHAR;
    v_cur_metadata JSONB;
    v_last_row_count INTEGER;
    v_sql_function_code SMALLINT;
    v_last_affected_cursor_id INTEGER;
BEGIN
    /* Getting the most recently changed cursor id,
       affected by DBMS_SQL procs or funcs:

       OPEN, CLOSE
       EXECUTE, EXECUTE_AND_FETCH
       TO_CURSOR_NUMBER, TO_REFCURSOR
    */
    v_last_affected_cursor_id := nullif(current_setting('sct$dbms_sql.last_affected_cursor_id', TRUE), '');

    -- Getting `last_row_count` variable value
    v_last_row_count := nullif(current_setting('sct$dbms_sql.last_row_count', TRUE), '');

    -- Getting cursor metadata (JSON) object
    v_cur_metadata := nullif(current_setting(format('sct$dbms_sql.cursor_id_%s_metadata',
                                                    v_last_affected_cursor_id), TRUE), '');

    -- Getting dynamic SQL function code from cursor metadata (JSON)
    v_sql_function_code := (v_cur_metadata ->> 'sql_func_code');

    -- func_code 4 for SELECT
    v_field_name := CASE v_sql_function_code
                       WHEN 4 THEN 'curr_row'
                       ELSE 'rows_count'
                    END;

    RETURN coalesce(v_last_row_count,
                    coalesce((v_cur_metadata ->> v_field_name)::NUMERIC, 0));
END;
$function$
LANGUAGE plpgsql;