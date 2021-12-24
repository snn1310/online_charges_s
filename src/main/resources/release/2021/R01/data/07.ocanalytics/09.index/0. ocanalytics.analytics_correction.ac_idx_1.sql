CREATE INDEX ac_idx_1
ON ocanalytics.analytics_correction
USING BTREE (ac_usage_date ASC, ac_correction_type ASC);

