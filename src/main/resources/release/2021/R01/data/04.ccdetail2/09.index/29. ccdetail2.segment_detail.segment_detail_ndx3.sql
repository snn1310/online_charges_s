CREATE INDEX segment_detail_ndx3
ON ccdetail2.segment_detail
USING BTREE (sgd_start_time ASC, sgd_end_time ASC, sgd_id ASC);

