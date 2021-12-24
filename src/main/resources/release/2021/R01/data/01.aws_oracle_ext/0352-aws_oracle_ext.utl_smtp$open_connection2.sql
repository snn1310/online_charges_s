create or replace function aws_oracle_ext.utl_smtp$open_connection2
(
  in host varchar,
  in port double precision default 25,
  in c aws_oracle_ext.utl_smtp$connection default null,
  in tx_timeout double precision default null,
  in wallet_path varchar default null,
  in wallet_password varchar default null,
  in secure_connection_before_smtp boolean default false
)
  returns aws_oracle_ext.utl_smtp$reply
as
$$
declare
  l_conn aws_oracle_ext.utl_smtp$connection;
  
  l_result aws_oracle_ext.utl_smtp$reply;
begin
  l_conn := aws_oracle_ext.utl_smtp$open_connection
    ( host, port, tx_timeout, wallet_path, wallet_password, secure_connection_before_smtp );

  l_result.code := 220;
  l_result.text := host || ' Service ready.';

  return l_result;
end;
$$ language plpgsql;