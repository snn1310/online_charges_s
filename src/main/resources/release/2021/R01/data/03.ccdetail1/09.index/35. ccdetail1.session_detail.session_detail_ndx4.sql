CREATE INDEX session_detail_ndx4
ON ccdetail1.session_detail
USING BTREE (ssd_session_id ASC, ssd_user_id ASC);

