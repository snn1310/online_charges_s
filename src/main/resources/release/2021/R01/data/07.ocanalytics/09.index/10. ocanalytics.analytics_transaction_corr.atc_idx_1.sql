CREATE INDEX atc_idx_1
ON ocanalytics.analytics_transaction_corr
USING BTREE (atc_bill_grp ASC, atc_usage_date ASC, atc_contact_num ASC, atc_client_id_text ASC);

