CREATE OR REPLACE FUNCTION aws_oracle_ext.set_version(pComponentVersion VARCHAR(256),pComponentName VARCHAR(256))
  RETURNS void AS
$BODY$
DECLARE
  rowcount smallint;
BEGIN
	UPDATE aws_oracle_ext.versions 
	   SET componentversion = pComponentVersion
	 WHERE extpackcomponentname = pComponentName;	 
	GET DIAGNOSTICS rowcount = ROW_COUNT;
	
	IF rowcount < 1 THEN
	 INSERT INTO aws_oracle_ext.versions(extpackcomponentname,componentversion) 
	      VALUES (pComponentName,pComponentVersion);
	END IF;
END;
$BODY$
LANGUAGE plpgsql;
