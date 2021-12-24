CREATE INDEX xif3usage_day
ON ocanalytics.usage_day
USING BTREE (ud_date ASC, ud_contact_num ASC);

