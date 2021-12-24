/*
Subprogram to replace UTL_SMTP.mail
 */
create or replace function aws_oracle_ext.utl_smtp$mail
  ( in c aws_oracle_ext.utl_smtp$connection, in sender character varying, in parameters character varying default '' )
  returns aws_oracle_ext.utl_smtp$reply
as
$$
declare 
  l_reply aws_oracle_ext.utl_smtp$reply;
  l_sender character varying := sender;
begin
  /* Temporary table to store message parts */
  drop table if exists utl_smtp$new_message;
  create temporary table if not exists utl_smtp$new_message
    ( msg_part serial
    , msg_body text );
  /* Temporary table to store recepients */
  drop table if exists utl_smtp$recipients;
  create temporary table if not exists utl_smtp$recipients
    ( num serial
    , address character varying( 512 ) );

  update tutl_smtp$connection set sender = l_sender;

  l_reply.code := 250;
  l_reply.text := 'Requested mail action okay, completed';
  return l_reply;
end;
$$ language plpgsql;