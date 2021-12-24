CREATE OR REPLACE FUNCTION aws_oracle_ext.init_context_struct()
 RETURNS void
 LANGUAGE sql
 SET client_min_messages TO 'error'
AS $function$
   	create temporary table if not exists context_local(
	  context_namespace text not null,
	  attribute_name text not null,  
	  attribute_value text,
	  user_name text,
	  cliend_id text,
	  signature text,
	  backend_start timestamp not null default now(),				  
	  pid int default pg_backend_pid(),
  	  constraint un_context_local unique (context_namespace, attribute_name)
	) on commit preserve rows;


	create unlogged table if not exists aws_oracle_context.context_global(
	  context_namespace text not null references aws_oracle_context.context on delete cascade,
	  attribute_name text not null,  
	  attribute_value text,
	  user_name text,
	  cliend_id text,
	  signature text,
	  backend_start timestamp not null default now(),				  
	  pid int default pg_backend_pid()
  	  ,constraint un_context_global unique (context_namespace, attribute_name, cliend_id)
	);
$function$
;
