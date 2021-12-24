create or replace function aws_oracle_ext.DBMS_OBFUSCATION_TOOLKIT$MD5(input_string in text, checksum_string inout text) as
$BODY$
  BEGIN
    checksum_string := md5(input_string);
  END;
$BODY$
LANGUAGE plpgsql;
