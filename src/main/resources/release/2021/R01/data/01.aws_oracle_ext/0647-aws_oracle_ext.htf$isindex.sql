CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$isindex
(
    cprompt IN TEXT  DEFAULT NULL,
    curl    IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT concat_ws('',
                     '<isindex',
                     aws_oracle_ext.htf$IFNOTNULL(cprompt, concat_ws('', ' prompt="',cprompt,'"')),
                     aws_oracle_ext.htf$IFNOTNULL(curl, concat_ws('', ' href="',curl,'"')),
                     '>');
$BODY$
LANGUAGE SQL
IMMUTABLE;

    
