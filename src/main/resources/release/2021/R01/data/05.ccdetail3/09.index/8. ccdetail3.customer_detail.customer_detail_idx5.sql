CREATE INDEX customer_detail_idx5
ON ccdetail3.customer_detail
USING BTREE (cd_user_id ASC, cd_domain ASC, cd_session_start_date ASC);

