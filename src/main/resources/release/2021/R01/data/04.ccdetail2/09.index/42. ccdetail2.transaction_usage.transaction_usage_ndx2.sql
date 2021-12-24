CREATE INDEX transaction_usage_ndx2
ON ccdetail2.transaction_usage
USING BTREE (sgd_id ASC, tu_session_start_date ASC, tu_tran_type ASC);

