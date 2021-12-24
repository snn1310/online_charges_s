create or replace function aws_oracle_ext.DBMS_OBFUSCATION_TOOLKIT$DESENCRYPT(input in bytea, key in bytea, encrypted_data inout bytea) as
$BODY$
  BEGIN
    encrypted_data := encrypt(input, key, 'des-cbc/pad:none');
  END;
$BODY$
LANGUAGE plpgsql;

