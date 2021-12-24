CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_assert$enquote_name(IN p_str_sqlname TEXT,
                                                                   IN p_capitalize BOOLEAN DEFAULT TRUE)
RETURNS TEXT
AS
$BODY$
DECLARE
    v_dblquote_count SMALLINT;
    v_str_sqlname TEXT := p_str_sqlname;
BEGIN
    /* Requires functions to be installed in aws_oracle_ext schema:
       - regexp_count.
    */

    v_dblquote_count := aws_oracle_ext.regexp_count(v_str_sqlname, '"');

    IF (mod(v_dblquote_count, 2) != 0) THEN
        RAISE USING MESSAGE := 'Invalid SQL name.',
                    DETAIL := 'Double quotes without paired adjacent double quotes are found. Oracle error ORA-44003.',
                    HINT := 'Input string literal must be corrected by removing unpaired double quotes or adding corresponding ones.';
    END IF;

    IF (char_length(coalesce(v_str_sqlname, '')) = 0) THEN
        v_str_sqlname := '""';
    ELSIF (left(v_str_sqlname, 1) != '"') THEN
        v_str_sqlname := concat('"', v_str_sqlname, '"');
    END IF;

    RETURN CASE
              WHEN p_capitalize AND v_dblquote_count = 0 THEN upper(v_str_sqlname)
              ELSE v_str_sqlname
           END;
END;
$BODY$
LANGUAGE plpgsql
STABLE;

