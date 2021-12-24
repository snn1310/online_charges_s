CREATE INDEX at_idx_1
ON ocanalytics.analytics_transaction
USING BTREE (at_bill_grp ASC, at_usage_date ASC, at_contact_num ASC, at_client_id_text ASC);

