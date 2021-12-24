/*
  Returns PostgreSQL character set name

  Parameters:
    ora_charset_name -- Oracle character set name

  Returns:
    PostgreSQL character set name
*/
CREATE OR REPLACE FUNCTION aws_oracle_ext.get_charset_name
(
    IN ora_charset_name VARCHAR
) 
RETURNS VARCHAR
AS
$BODY$

    SELECT COALESCE
    (
        (
            SELECT m.postgresql_charset
            FROM aws_oracle_ext.charset_mapping m
            WHERE STRPOS(LOWER(ora_charset_name), LOWER(m.oracle_charset)) > 0
            LIMIT 1
        ),
        'UNICODE'
    );

$BODY$
STABLE
LANGUAGE SQL;
