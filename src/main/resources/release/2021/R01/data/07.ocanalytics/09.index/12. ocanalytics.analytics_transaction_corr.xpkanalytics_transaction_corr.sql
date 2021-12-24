CREATE UNIQUE INDEX xpkanalytics_transaction_corr
ON ocanalytics.analytics_transaction_corr
USING BTREE (atc_id ASC, atc_usage_date ASC);

