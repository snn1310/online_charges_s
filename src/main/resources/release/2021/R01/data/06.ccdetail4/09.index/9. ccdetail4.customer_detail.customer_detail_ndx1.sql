CREATE INDEX customer_detail_ndx1
ON ccdetail4.customer_detail
USING BTREE (cd_user_id DESC, cd_contact_num DESC);

