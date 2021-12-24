CREATE INDEX ix_asc_capped_usage_date
ON ocanalytics.analytics_segment_corr
USING BTREE (asc_capped_client_id ASC, asc_usage_date ASC);

