CREATE OR REPLACE FUNCTION aws_oracle_ext.get_version(pComponentName VARCHAR(256))
  RETURNS VARCHAR(256) AS
$BODY$
	SELECT componentversion 
	  FROM aws_oracle_ext.versions
	 WHERE extpackcomponentname = pComponentName;
$BODY$
LANGUAGE sql;