CREATE OR REPLACE FUNCTION aws_oracle_ext.owa_cookie$get
(
    name IN TEXT
)
RETURNS JSON AS
$BODY$
DECLARE
    http_cookie TEXT;
    vResult JSON;
BEGIN

    http_cookie := aws_oracle_ext.owa_util$get_cgi_env('HTTP_COOKIE');

    TRUNCATE TABLE aws_cgi_cookie;

    IF LENGTH(COALESCE(TRIM(http_cookie),'')) <> 0 THEN

        INSERT INTO aws_cgi_cookie(cookie_name, cookie_val)
        SELECT
            SUBSTR
            (
                LTRIM(v),
                1,
                STRPOS
                (
                    LTRIM(v),
                    '='
                ) - 1
            ),
            SUBSTR
            (
                LTRIM(v),
                STRPOS(LTRIM(v), '=') + 1
            )
        FROM REGEXP_SPLIT_TO_TABLE(SUBSTR(http_cookie, 1, LENGTH(http_cookie) - 1), ';') v;

    END IF;

    SELECT JSON_BUILD_OBJECT
    (
        'name', cookie_name
        ,
        'vals', vals
        ,
        'num_vals', num_vals
    )
    INTO vResult
    FROM
    (
        SELECT cookie_name,
            COUNT(cookie_val_id) AS num_vals,
        ARRAY_AGG(cookie_val) AS vals
        FROM aws_cgi_cookie 
        WHERE cookie_name = name
        GROUP BY cookie_name
    ) z;

    IF vResult IS NULL THEN

        vResult := JSON_BUILD_OBJECT
        (
            'name', name
            ,
            'num_vals', 0
        );

    END IF;


    RETURN vResult;

END;
$BODY$
LANGUAGE plpgsql;