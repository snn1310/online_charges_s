CREATE INDEX at_idx_acci_aud
ON ocanalytics.analytics_transaction
USING BTREE (at_capped_client_id ASC, at_usage_date ASC);

