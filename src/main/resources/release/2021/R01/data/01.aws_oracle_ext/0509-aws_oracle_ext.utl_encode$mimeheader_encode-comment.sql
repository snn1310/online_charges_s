COMMENT ON FUNCTION  aws_oracle_ext.UTL_ENCODE$MIMEHEADER_ENCODE(buf character varying, encode_charset character varying, encoding_flag integer)  IS
'The buf input parameter is the text to be encoded and becomes the <encoded text>.
The <encoding> value is either "Q" or "B" for quoted-printable encode or base64 encoding respectively. The ENCODING input parameter accepts as valid values UTL_ENCODE.QUOTED_PRINTABLE or UTL_ENCODE.BASE64 or NULL. If NULL, quoted-printable encoding is selected as a default value.
The <charset> value is specified as the input parameter encode_charset. If NULL, the database character set is selected as a default value.
';
