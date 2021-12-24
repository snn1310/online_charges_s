CREATE INDEX transaction_usage_ndx1
ON ccdetail1.transaction_usage
USING BTREE (tu_timestamp ASC);

