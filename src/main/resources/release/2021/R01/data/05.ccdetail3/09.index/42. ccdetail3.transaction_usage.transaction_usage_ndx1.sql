CREATE INDEX transaction_usage_ndx1
ON ccdetail3.transaction_usage
USING BTREE (tu_timestamp ASC);

