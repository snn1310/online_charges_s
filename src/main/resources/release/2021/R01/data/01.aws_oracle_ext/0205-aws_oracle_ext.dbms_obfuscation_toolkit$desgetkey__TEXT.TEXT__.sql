create or replace function aws_oracle_ext.DBMS_OBFUSCATION_TOOLKIT$DESGETKEY(seed in text, key inout text) as
$BODY$
  BEGIN
    key := crypt(seed, gen_salt('des'));
  END;
$BODY$
LANGUAGE plpgsql;
