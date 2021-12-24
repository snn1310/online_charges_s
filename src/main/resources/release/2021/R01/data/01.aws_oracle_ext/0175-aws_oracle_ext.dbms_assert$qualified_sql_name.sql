CREATE OR REPLACE FUNCTION aws_oracle_ext.dbms_assert$qualified_sql_name(IN p_str_sqlname_list TEXT)
RETURNS TEXT
AS
$BODY$
DECLARE
    v_str_sqlname VARCHAR;
BEGIN
    FOREACH v_str_sqlname IN ARRAY regexp_split_to_array(p_str_sqlname_list, '[.@]')
    LOOP
        PERFORM aws_oracle_ext.dbms_assert$simple_sql_name(v_str_sqlname);
    END LOOP;

    RETURN p_str_sqlname_list;
EXCEPTION
    WHEN OTHERS THEN
        RAISE USING MESSAGE := 'Invalid qualified SQL name.',
                    DETAIL := 'Input string literal is not a valid qualified SQL name. Oracle error ORA-44004.',
                    HINT := 'Verify that supplied SQL name (compound name) represent a valid SQL name.';
END;
$BODY$
LANGUAGE plpgsql
STABLE;

