CREATE OR REPLACE FUNCTION aws_oracle_ext.wrap_refcursor
(
    IN REFCURSOR,
    INOUT REFCURSOR
)
LANGUAGE plpgsql
AS
$wrap_refcursor$
DECLARE
    vstmt TEXT;
BEGIN
    
	vstmt := $1;

	SELECT pc.statement 
	INTO vstmt
	FROM pg_cursors pc
	WHERE pc.name = vstmt;

	OPEN $2 FOR EXECUTE vstmt;

	CLOSE $1;
    
END;
$wrap_refcursor$;





