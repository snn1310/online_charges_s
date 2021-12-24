create type aws_oracle_ext.dbms_aq$message_properties_t AS (
   priority               integer,
   delay                  integer,
   expiration             integer,
   correlation            VARCHAR(128),
   attempts               integer,
   recipient_list         json,--AQ_RECIPIENT_LIST_T( --json of SQS_AQ_AGENT)
   exception_queue        VARCHAR(61),
   enqueue_time           TIMESTAMP(0) WITHOUT TIME ZONE,
   state                  integer,
   sender_id              aws_oracle_ext.sqs_aq$_agent,
   original_msgid         BYTEA,
   signature              aws_oracle_ext.SQS_aq$_sig_prop,
   transaction_group      VARCHAR(30),
   user_property          VARCHAR(8000),
   delivery_mode          integer
);
