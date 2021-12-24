CREATE INDEX billing_detail_idx2
ON ocdetail.billing_detail
USING BTREE (bd_usage_date ASC, bd_domain ASC);

