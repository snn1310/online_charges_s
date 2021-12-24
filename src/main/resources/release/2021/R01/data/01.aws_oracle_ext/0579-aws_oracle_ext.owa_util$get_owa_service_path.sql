CREATE OR REPLACE FUNCTION aws_oracle_ext.owa_util$get_owa_service_path()
RETURNS TEXT AS
$BODY$
DECLARE
    script_name TEXT;
BEGIN

    script_name := aws_oracle_ext.owa_util$get_cgi_env('SCRIPT_NAME');

    script_name := CONCAT
    (
        script_name,
        CASE
            WHEN SUBSTR(script_name,-1) = '/' then
                ''
            ELSE
                '/'
        END
    );
    
    RETURN script_name;

END;
$BODY$
LANGUAGE plpgsql;