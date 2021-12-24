CREATE INDEX transaction_usage_ndx1
ON ocdetail.transaction_usage
USING BTREE (tu_timestamp ASC);

