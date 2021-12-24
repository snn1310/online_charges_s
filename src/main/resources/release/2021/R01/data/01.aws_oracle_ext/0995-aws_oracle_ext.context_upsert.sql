CREATE OR REPLACE FUNCTION aws_oracle_ext.context_upsert(c_namespace text, c_type text)
 RETURNS void
 LANGUAGE sql
 RETURNS NULL ON NULL INPUT
AS $function$
	create schema if not exists aws_oracle_context;
	create table if not exists aws_oracle_context.context(
		context_namespace varchar(30) not null, 
		context_type varchar(22) not null,
		constraint pk_context primary key (context_namespace)
	);
	
	INSERT INTO aws_oracle_context.context VALUES 
	(
		aws_oracle_ext.format_identifier_case($1), 
		UPPER($2)
	)
	ON CONFLICT(context_namespace) DO UPDATE
	SET context_type =  UPPER($2);
$function$;