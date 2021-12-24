CREATE INDEX session_detail_ndx4
ON ocdetail.session_detail
USING BTREE (ssd_session_id ASC, ssd_user_id ASC);

