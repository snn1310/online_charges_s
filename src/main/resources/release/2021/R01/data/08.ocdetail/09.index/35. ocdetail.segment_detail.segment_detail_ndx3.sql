CREATE INDEX segment_detail_ndx3
ON ocdetail.segment_detail
USING BTREE (sgd_start_time ASC, sgd_end_time ASC, sgd_id ASC);

