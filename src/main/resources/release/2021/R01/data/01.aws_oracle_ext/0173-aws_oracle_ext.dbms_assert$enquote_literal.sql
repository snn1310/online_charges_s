CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_assert$enquote_literal(IN p_str_literal TEXT)
RETURNS TEXT
AS
$BODY$
BEGIN
    /* Requires functions to be installed in aws_oracle_ext schema:
       - regexp_count.
    */

    IF (mod(aws_oracle_ext.regexp_count(p_str_literal, ''''), 2) != 0) THEN
        RAISE USING MESSAGE := 'Numeric or value error.',
                    DETAIL := 'Single quotes without paired adjacent single quotes are found. Oracle error ORA-06502.',
                    HINT := 'Verify that all single quotes except leading and trailing characters are paired with adjacent single quotes.';
    END IF;

    RETURN concat('''', p_str_literal, '''');
END;
$BODY$
LANGUAGE plpgsql
STABLE;

