CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_assert$simple_sql_name(IN p_str_sqlname TEXT)
RETURNS TEXT
AS
$BODY$
DECLARE
    v_str_sqlname VARCHAR := trim(p_str_sqlname);
BEGIN
    /* Requires functions to be installed in aws_oracle_ext schema:
       - regexp_count;
       - regexp_substr.
    */

    -- SQL name could not be blank (empty).
    IF (char_length(coalesce(v_str_sqlname, '')) = 0) THEN
        RAISE invalid_name;
    END IF;

    -- Determining if the sql name is quoted or not.
    IF (p_str_sqlname ~* '"') THEN
        -- All double quotes in the sql name should be paired.
        IF (mod(aws_oracle_ext.regexp_count(p_str_sqlname, '"'), 2) != 0) THEN
            RAISE invalid_name;
        -- Quoted identifier could not contain any other double quotes.
        ELSIF (aws_oracle_ext.regexp_substr(p_str_sqlname, '"(.+)"', 1, 1) ~* '"') THEN
            RAISE invalid_name;
        END IF;
    ELSE
        -- Nonquoted sql name allows only alphanumeric and _, $, # characters.
        IF (v_str_sqlname !~* '^[a-z_\$#]+$') THEN
            RAISE invalid_name;
        -- Nonquoted sql name must begin with an alphabetic character.
        ELSIF (left(v_str_sqlname, 1) !~* '[a-z]') THEN
            RAISE invalid_name;
        END IF;
    END IF;

    RETURN p_str_sqlname;
EXCEPTION
    WHEN invalid_name THEN
        RAISE USING MESSAGE := 'Invalid SQL name.',
                    DETAIL := 'Input string literal is not a valid simple SQL name. Oracle error ORA-44003.',
                    HINT := 'Verify that supplied SQL name represent a valid simple SQL name.';
END;
$BODY$
LANGUAGE plpgsql
STABLE;

