ALTER TABLE aws_oracle_ext.sqs_queues_settings
    ADD CONSTRAINT fk_sqs_queues_settings_tableid FOREIGN KEY (tableid)
    REFERENCES aws_oracle_ext.sqs_queues_tables(id) ON DELETE CASCADE;