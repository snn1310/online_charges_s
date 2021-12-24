/*
Type to replace UTL_SMTP.reply
 */
create type aws_oracle_ext.utl_smtp$reply
as
( code integer,
  text character varying(508) );