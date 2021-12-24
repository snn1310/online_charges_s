CREATE INDEX detail_correction_ndx1
ON ccdetail.detail_correction
USING BTREE (dc_usage_date ASC, dc_correction_type ASC);

