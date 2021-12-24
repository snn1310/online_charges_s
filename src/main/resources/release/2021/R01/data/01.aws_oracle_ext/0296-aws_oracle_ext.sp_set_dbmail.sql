/* Function to set attributes of the processed message by its id

   parameters:
     par_mail_id - message's id
     par_sent_status - for compliance, ignored
     par_message - text of error if occurred 
     par_processed_at - timestamp of processing, clock_timestamp() by default
*/
drop function if exists aws_oracle_ext.sp_set_dbmail( in bigint, in timestamp with time zone, in character varying );

create or replace function aws_oracle_ext.sp_set_dbmail
  ( in par_mail_id bigint
  , in par_sent_status integer
  , in par_message character varying default null 
  , in par_processed_at timestamp with time zone default clock_timestamp() )
  returns void
as
$$
begin
  update aws_oracle_ext.mail_messages m
     set processed_at = par_processed_at
       , error_text = par_message
   where m.id = par_mail_id;
end;
$$ language plpgsql; 