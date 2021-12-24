/* Function to get new mail waiting for sending

   It updates first p_limit rows having empty read_at and returns them

   parameters:
     p_limit - returned rows limit, default 1

   returns:
     id - message's id
     sender - sender's address
     raw_email - email with all the headers and body
 */
drop function if exists aws_oracle_ext.sp_get_dbmail( in integer );

create or replace function aws_oracle_ext.sp_get_dbmail
  ( in p_limit integer default 1 )
  returns table
    ( par_mail_id aws_oracle_ext.mail_messages.id%type
    , par_mail_data xml )
as
$$
declare
  l_now timestamp with time zone := clock_timestamp();
begin
  return query
    update aws_oracle_ext.mail_messages m
       set read_at = l_now
      from ( 
        select mm.id 
          from aws_oracle_ext.mail_messages mm 
         where mm.read_at is null
           and pg_try_advisory_xact_lock( mm.id )
         limit p_limit 
           for update
      ) i
     where m.id = i.id
    returning m.id, xmlelement( name mail, null, xmlconcat( xmlelement(name source, null, m.sender ), xmlelement( name rawmessage, null, m.body ) ) ) ;
end;
$$ language plpgsql;