CREATE OR REPLACE FUNCTION aws_oracle_ext.owa$init_cgi_env
(
    IN pParams JSON
)
RETURNS VOID AS
$BODY$
BEGIN

    CREATE TEMPORARY TABLE IF NOT EXISTS aws_cgi_env
    (
        id BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
        cgi_var_name TEXT NULL,
        cgi_var_val TEXT NULL,
        CONSTRAINT ht_headers_pk PRIMARY KEY (id)
    );

    TRUNCATE TABLE aws_cgi_env;

    INSERT INTO aws_cgi_env(cgi_var_name, cgi_var_val)
    SELECT * FROM JSON_EACH_TEXT(pParams);

    INSERT INTO aws_cgi_env(cgi_var_name, cgi_var_val)
    VALUES ('REMOTE_USER', CURRENT_SCHEMA());


END;
$BODY$
LANGUAGE plpgsql;