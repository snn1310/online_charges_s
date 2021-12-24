ALTER TABLE aws_oracle_ext.sqs_queues_tables
    ADD CONSTRAINT unq_sqs_queues_tables UNIQUE (tschema, tname, tdatatypeschema, tdatatypename);