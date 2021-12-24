CREATE OR REPLACE FUNCTION aws_oracle_ext.delete
(
    parray IN ANYARRAY
)
RETURNS ANYARRAY
LANGUAGE plpgsql
AS
$BODY$
BEGIN

/* DELETE removes all elements from a collection */
    RETURN '{}';

END;
$BODY$;
