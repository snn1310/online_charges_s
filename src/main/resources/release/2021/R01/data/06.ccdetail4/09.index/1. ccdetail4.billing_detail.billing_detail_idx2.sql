CREATE INDEX billing_detail_idx2
ON ccdetail4.billing_detail
USING BTREE (bd_usage_date ASC, bd_domain ASC);

