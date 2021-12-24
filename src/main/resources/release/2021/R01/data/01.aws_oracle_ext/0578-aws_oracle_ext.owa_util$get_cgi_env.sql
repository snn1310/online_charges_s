CREATE OR REPLACE FUNCTION aws_oracle_ext.owa_util$get_cgi_env
(
    IN param_name TEXT
)
RETURNS TEXT AS
$BODY$
DECLARE
    vResult TEXT;
BEGIN

    SELECT cgi_var_val
    INTO vResult
    FROM aws_cgi_env
    WHERE UPPER(cgi_var_name) = UPPER(param_name)
    ORDER BY id
    LIMIT 1;

    RETURN vResult;

END;
$BODY$
LANGUAGE plpgsql;