create or replace function aws_oracle_ext.DBMS_OBFUSCATION_TOOLKIT$MD5(input in bytea, checksum inout bytea) as
$BODY$
  BEGIN
    checksum := md5(input);
  END;
$BODY$
LANGUAGE plpgsql;
