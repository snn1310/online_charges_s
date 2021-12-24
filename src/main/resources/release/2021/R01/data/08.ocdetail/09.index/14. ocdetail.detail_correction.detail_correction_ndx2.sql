CREATE INDEX detail_correction_ndx2
ON ocdetail.detail_correction
USING BTREE (dc_original_data_id ASC, dc_version ASC, dc_corrected_data_id ASC);

