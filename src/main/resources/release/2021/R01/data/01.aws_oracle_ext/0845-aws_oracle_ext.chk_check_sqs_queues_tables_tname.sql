ALTER TABLE aws_oracle_ext.sqs_queues_tables
    ADD CONSTRAINT chk_check_sqs_queues_tables_tname CHECK (((tname)::text = lower((tname)::text)));