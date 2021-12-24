CREATE INDEX ac_idx_2_new
ON ocanalytics.analytics_correction_new
USING BTREE (ac_corrected_data_id ASC, ac_version ASC, ac_original_data_id ASC);

