create or replace function aws_oracle_ext.DBMS_OBFUSCATION_TOOLKIT$DESGETKEY(seed in text) returns text as
$BODY$
  BEGIN
    return crypt(seed, gen_salt('des'));
  END;
$BODY$
LANGUAGE plpgsql RETURNS NULL ON NULL INPUT;
