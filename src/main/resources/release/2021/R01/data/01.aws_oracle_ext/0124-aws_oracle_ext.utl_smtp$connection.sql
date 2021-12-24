/*
Type to replace an UTL_SMTP.connection.
 */
create type aws_oracle_ext.utl_smtp$connection
as
( host character varying(255),
  port              integer,
  tx_timeout        integer);