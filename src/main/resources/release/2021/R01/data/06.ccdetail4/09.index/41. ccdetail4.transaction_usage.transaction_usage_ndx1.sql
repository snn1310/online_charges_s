CREATE INDEX transaction_usage_ndx1
ON ccdetail4.transaction_usage
USING BTREE (tu_timestamp ASC);

