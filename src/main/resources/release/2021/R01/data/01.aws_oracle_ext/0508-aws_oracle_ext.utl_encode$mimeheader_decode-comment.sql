COMMENT ON FUNCTION  aws_oracle_ext.UTL_ENCODE$MIMEHEADER_DECODE(buf character varying)  IS
'This function accepts as input an "encoded word" of the form:
=?<charset>?<encoding>?<encoded text>?= 
=?ISO-8859-1?Q?Here is some encoded text?= 
The <encoded text> is encapsulated in mime header tags which give the MIMEHEADER_DECODE function information about how to decode the string. 
The mime header metadata tags are stripped from the input string and the <encoded text> is converted to the base database character set
';
