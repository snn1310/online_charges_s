CREATE INDEX xif4usage_day
ON ocanalytics.usage_day
USING BTREE (ud_date ASC, ud_client_id_text ASC);

