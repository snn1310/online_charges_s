CREATE INDEX billing_detail_idx1
ON ccdetail2.billing_detail
USING BTREE (bd_usage_date ASC);

