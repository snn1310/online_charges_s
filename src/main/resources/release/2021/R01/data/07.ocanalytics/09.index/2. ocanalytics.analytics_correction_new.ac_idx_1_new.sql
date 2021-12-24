CREATE INDEX ac_idx_1_new
ON ocanalytics.analytics_correction_new
USING BTREE (ac_usage_date ASC, ac_correction_type ASC);

