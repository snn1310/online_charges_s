create or replace function aws_oracle_ext.UTL_ENCODE$TEXT_ENCODE(buf character varying, encode_charset character varying default null, encoding_flag integer default null)  returns CHARACTER VARYING as 
$BODY$  
BEGIN
  if encode_charset is null then    
    SELECT pg_encoding_to_char(encoding) into encode_charset FROM pg_database WHERE datname = current_database();
  else 
    encode_charset := aws_oracle_ext.get_charset_name(encode_charset);   
  end if;
  return encode(convert_to(buf, encode_charset)::bytea, case when encoding_flag = 1 then 'base64' else 'escape' end);
END;  
$BODY$
LANGUAGE plpgsql;
