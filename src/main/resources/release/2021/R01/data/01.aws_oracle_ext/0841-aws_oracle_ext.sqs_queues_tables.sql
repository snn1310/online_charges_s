CREATE TABLE aws_oracle_ext.sqs_queues_tables (
	id serial NOT NULL,
	tschema varchar(250) NOT NULL DEFAULT "current_schema"(),
	tname varchar(250) NOT NULL,
	tdatatypeschema varchar(250) NULL DEFAULT "current_schema"(),
	tdatatypename varchar(250) NULL
);