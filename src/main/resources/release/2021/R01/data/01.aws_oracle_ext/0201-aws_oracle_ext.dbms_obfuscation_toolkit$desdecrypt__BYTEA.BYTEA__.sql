create or replace function aws_oracle_ext.DBMS_OBFUSCATION_TOOLKIT$DESDECRYPT(input in bytea, key in bytea) returns bytea as
$BODY$
  BEGIN
    return decrypt(input, key, 'des-cbc/pad:none');
  END;
$BODY$
LANGUAGE plpgsql;
