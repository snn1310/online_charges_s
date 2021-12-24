create or replace function aws_oracle_ext.DBMS_OBFUSCATION_TOOLKIT$MD5(input_string in text) returns text as
$BODY$
  BEGIN
    return md5(input_string);
  END;
$BODY$
LANGUAGE plpgsql RETURNS NULL ON NULL INPUT;
