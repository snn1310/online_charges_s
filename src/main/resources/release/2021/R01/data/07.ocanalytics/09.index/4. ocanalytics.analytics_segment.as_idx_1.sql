CREATE INDEX as_idx_1
ON ocanalytics.analytics_segment
USING BTREE (as_bill_grp ASC, as_usage_date ASC, as_contact_num ASC, as_client_id_text ASC);

