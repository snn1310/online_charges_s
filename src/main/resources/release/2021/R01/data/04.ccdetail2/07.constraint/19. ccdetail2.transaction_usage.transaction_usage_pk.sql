ALTER TABLE ccdetail2.transaction_usage
ADD CONSTRAINT transaction_usage_pk PRIMARY KEY (tu_id, tu_session_start_date);

