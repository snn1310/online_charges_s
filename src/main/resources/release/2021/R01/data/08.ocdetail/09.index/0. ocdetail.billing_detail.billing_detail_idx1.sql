CREATE INDEX billing_detail_idx1
ON ocdetail.billing_detail
USING BTREE (bd_usage_date ASC);

