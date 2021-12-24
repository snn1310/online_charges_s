CREATE INDEX session_detail_ndx1
ON ccdetail1.session_detail
USING BTREE (ssd_user_id ASC, ssd_domain ASC, ssd_end_time ASC, ssd_start_time ASC);

