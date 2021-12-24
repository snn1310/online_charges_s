/*
Subprograms to replace UTL_SMTP.open_connection subprograms
 */
create or replace function aws_oracle_ext.utl_smtp$open_connection
(
  in host varchar,
  in port double precision default 25,
  in tx_timeout double precision default null,
  in wallet_path varchar default null,
  in wallet_password varchar default null,
  in secure_connection_before_smtp boolean default false
)
  returns aws_oracle_ext.utl_smtp$connection
as
$$
declare
  l_result aws_oracle_ext.utl_smtp$connection;
begin

  drop table if exists tutl_smtp$connection;

  create temporary table if not exists tutl_smtp$connection
    ( conn aws_oracle_ext.utl_smtp$connection
    , sender character varying );

  l_result.host := host;
  l_result.port := port;
  l_result.tx_timeout := tx_timeout;

  insert into tutl_smtp$connection( conn ) values( l_result );

  return l_result;

end;
$$ language plpgsql;

