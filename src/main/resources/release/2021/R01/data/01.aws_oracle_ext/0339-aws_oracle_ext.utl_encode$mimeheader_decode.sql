create or replace function aws_oracle_ext.UTL_ENCODE$MIMEHEADER_DECODE(buf character varying)  returns CHARACTER VARYING as 
$BODY$
DECLARE
  l_charset CHARACTER VARYING;
  encoding_flag  CHARACTER VARYING;
BEGIN
  l_charset := (regexp_matches(buf, '\=\?(.*?)\?', 'g'))[1];
  encoding_flag := (regexp_matches(buf, '\?(.)\?', 'g'))[1];

  if l_charset is null or encoding_flag is null then return null; end if;  

  buf := (regexp_matches(buf, concat(encoding_flag, '\?(.*?)\?\='), 'g'))[1];

  return decode(convert_from(buf::bytea, l_charset), case when encoding_flag = 'B' then 'base64' else 'escape' end); 
END
$BODY$
LANGUAGE plpgsql;
