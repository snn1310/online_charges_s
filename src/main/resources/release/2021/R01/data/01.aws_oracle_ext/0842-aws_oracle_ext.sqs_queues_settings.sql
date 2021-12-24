CREATE TABLE aws_oracle_ext.sqs_queues_settings (
	qname varchar(250) NOT NULL,
	qpurename varchar(250) NOT NULL,
	url varchar(4000) NULL,
	arn varchar(4000) NULL,
	qtype varchar(4) NULL,
	tableid int4 NULL
);
