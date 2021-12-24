create or replace function aws_oracle_ext.DBMS_OBFUSCATION_TOOLKIT$DESDECRYPT(input in bytea, key in bytea, decrypted_data inout bytea) as
$BODY$
  BEGIN
    decrypted_data := decrypt(input, key, 'des-cbc/pad:none');
  END;
$BODY$
LANGUAGE plpgsql;
