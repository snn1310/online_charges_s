CREATE INDEX segment_detail_ndx1
ON ccdetail1.segment_detail
USING BTREE (ssd_id ASC, sgd_start_time ASC);

