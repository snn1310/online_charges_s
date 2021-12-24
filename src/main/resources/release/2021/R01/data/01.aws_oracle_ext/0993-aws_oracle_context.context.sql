CREATE TABLE IF NOT EXISTS aws_oracle_context.context(
	context_namespace varchar(30) not null, 
	context_type varchar(22) not null,
	constraint pk_context primary key (context_namespace)
);
