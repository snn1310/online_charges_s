COMMENT ON FUNCTION  aws_oracle_ext.UTL_ENCODE$TEXT_ENCODE(buf character varying, encode_charset character varying, encoding_flag integer)  IS
'This function converts the input text to the target character set as specified by the encode_charset parameter, if not NULL. 
The text is encoded to either base64 or quoted-printable format, as specified by the encoding parameter.';
