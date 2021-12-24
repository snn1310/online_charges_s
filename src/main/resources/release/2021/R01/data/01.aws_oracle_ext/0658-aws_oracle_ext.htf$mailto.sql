CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$mailto
(
    caddress    IN TEXT,
    ctext       IN TEXT,
    cname       IN TEXT  DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT aws_oracle_ext.htf$anchor(concat_ws('', 'mailto:', caddress),
                                     ctext,
                                     cname,
                                     cattributes);

$BODY$
LANGUAGE SQL
IMMUTABLE;


