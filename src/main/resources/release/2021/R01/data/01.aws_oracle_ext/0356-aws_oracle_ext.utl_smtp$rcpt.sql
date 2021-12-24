/*
Subprogram to replace UTL_SMTP.rcpt
 */
create or replace function aws_oracle_ext.utl_smtp$rcpt
(
  in c aws_oracle_ext.utl_smtp$connection,
  in recipient character varying,
  in parameters character varying default null
)
  returns aws_oracle_ext.utl_smtp$reply
as
$$
declare 
  l_reply aws_oracle_ext.utl_smtp$reply;
begin

  insert into utl_smtp$recipients( address ) values( recipient );

  l_reply.code := 250;
  l_reply.text := 'Requested mail action okay, completed';
  return l_reply;
end;
$$ language plpgsql;
