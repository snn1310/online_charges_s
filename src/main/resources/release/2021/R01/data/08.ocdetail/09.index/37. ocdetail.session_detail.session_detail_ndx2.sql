CREATE INDEX session_detail_ndx2
ON ocdetail.session_detail
USING BTREE (ssd_end_time DESC, ssd_start_time DESC);

