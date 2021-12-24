create or replace function aws_oracle_ext.DBMS_OBFUSCATION_TOOLKIT$MD5(input in bytea) returns bytea as
$BODY$
  BEGIN
    return md5(input);
  END;
$BODY$
LANGUAGE plpgsql RETURNS NULL ON NULL INPUT;
