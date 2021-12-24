CREATE INDEX session_detail_ndx3
ON ocdetail.session_detail
USING BTREE (ssd_start_time ASC, ssd_end_time DESC);

