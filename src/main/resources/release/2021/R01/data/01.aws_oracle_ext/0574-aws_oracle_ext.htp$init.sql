CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$init()
RETURNS VOID AS
$BODY$

    CREATE TEMPORARY TABLE IF NOT EXISTS aws_cgi_env
    (
        id BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
        cgi_var_name TEXT NULL,
        cgi_var_val TEXT NULL,
        CONSTRAINT ht_headers_pk PRIMARY KEY (id)
    );

    CREATE TEMPORARY TABLE IF NOT EXISTS aws_htbuf_arr
    (
        id BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
        column_value TEXT NULL,
        CONSTRAINT htbuf_arr_pk PRIMARY KEY (id)
    );

    TRUNCATE TABLE aws_htbuf_arr;

    CREATE TEMPORARY TABLE IF NOT EXISTS aws_cgi_cookie
    (
        cookie_name TEXT NOT NULL,
        cookie_val_id BIGINT NOT null GENERATED ALWAYS AS IDENTITY,
        cookie_val TEXT NULL,
        CONSTRAINT aws_cgi_cookies_pk PRIMARY KEY (cookie_name)
    );

    TRUNCATE TABLE aws_cgi_cookie;

$BODY$
LANGUAGE sql;