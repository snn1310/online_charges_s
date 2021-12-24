CREATE INDEX ixc_at_capped_usage_date
ON ocanalytics.analytics_transaction_corr
USING BTREE (atc_capped_client_id ASC, atc_usage_date ASC);

