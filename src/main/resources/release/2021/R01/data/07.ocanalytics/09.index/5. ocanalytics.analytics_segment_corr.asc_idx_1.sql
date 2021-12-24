CREATE INDEX asc_idx_1
ON ocanalytics.analytics_segment_corr
USING BTREE (asc_bill_grp ASC, asc_usage_date ASC, asc_contact_num ASC, asc_client_id_text ASC);

