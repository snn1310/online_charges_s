create or replace function aws_oracle_ext.UTL_ENCODE$TEXT_DECODE(buf character varying, encode_charset character varying default null, encoding_flag integer default null)  returns CHARACTER VARYING as 
$BODY$
DECLARE
BEGIN
  if encode_charset is not null then buf := convert_from(buf::bytea, encode_charset); end if;
  return decode(buf, case when encoding_flag = 1 then 'base64' else 'escape' end); 
END;
$BODY$
LANGUAGE plpgsql;
