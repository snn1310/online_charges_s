CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$param
(
    cname     IN TEXT,
    cvalue     IN TEXT
)

RETURNS TEXT AS
$BODY$

    SELECT concat_ws('', 
                     '<param name=',
                     cname,
                     ' value= "',
                     cvalue,
                     '" >');

$BODY$
LANGUAGE SQL
IMMUTABLE;


