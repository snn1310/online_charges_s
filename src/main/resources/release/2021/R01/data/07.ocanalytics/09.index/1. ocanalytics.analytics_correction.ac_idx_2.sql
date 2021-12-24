CREATE INDEX ac_idx_2
ON ocanalytics.analytics_correction
USING BTREE (ac_corrected_data_id ASC, ac_version ASC, ac_original_data_id ASC);

