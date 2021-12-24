CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_sql$execute_and_fetch(IN p_cursor_id INTEGER,
                                                                     IN p_exact_match BOOLEAN DEFAULT FALSE)
RETURNS NUMERIC
AS
$function$
DECLARE
    v_rows_count INTEGER;
    v_rows_fetched INTEGER;
BEGIN
    -- Executing a statement associated with the given cursor
    v_rows_count := aws_oracle_ext.dbms_sql$execute(p_cursor_id);

    -- Fetching a row from the given cursor
    v_rows_fetched := aws_oracle_ext.dbms_sql$fetch_rows(p_cursor_id);

    /* Raise an exception if the number of rows actually matching the query differs from 1.
       This behaviour is actual if "p_exact_match" param passed value is TRUE.
       -----------------------------------------------------------------------
       "ORA-01403: no data found" - if `v_rows_count` value is NULL or zero.
       "ORA-01422: exact fetch returns more than requested number of rows" - if `v_rows_count` value is more than one.
    */
    IF (coalesce(p_exact_match, FALSE))
    THEN
        IF (v_rows_count > 1)
        THEN
            -- ORA-01422
            RAISE too_many_rows;
        ELSIF (coalesce(v_rows_count, 0) = 0)
        THEN
            -- ORA-01403
            RAISE no_data_found;
        END IF;
    END IF;

    RETURN v_rows_fetched;
EXCEPTION
    -- Cursor fetch returns more than one row
    WHEN too_many_rows THEN
        RAISE USING MESSAGE := 'Exact fetch returns more than requested number of rows.',
                    DETAIL := 'The number specified in exact fetch is less than the rows returned.',
                    HINT := '-1422';

    -- Fetch from cursor results in zero rows
    WHEN no_data_found THEN
        RAISE USING MESSAGE := 'No data found.',
                    DETAIL := 'Fetch from cursor results in zero rows.',
                    HINT := '-1403';
END;
$function$
LANGUAGE plpgsql;