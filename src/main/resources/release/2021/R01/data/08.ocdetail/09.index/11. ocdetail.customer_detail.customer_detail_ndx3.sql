CREATE INDEX customer_detail_ndx3
ON ocdetail.customer_detail
USING BTREE (cd_user_id DESC, cd_usage_date DESC);

