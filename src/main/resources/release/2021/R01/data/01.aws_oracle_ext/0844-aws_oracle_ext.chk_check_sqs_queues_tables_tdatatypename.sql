ALTER TABLE aws_oracle_ext.sqs_queues_tables
    ADD CONSTRAINT chk_check_sqs_queues_tables_tdatatypename CHECK (((tdatatypename)::text = lower((tdatatypename)::text)));