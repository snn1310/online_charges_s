CREATE UNIQUE INDEX xpkusage_day
ON ocanalytics.usage_day
USING BTREE (ud_id ASC, ud_date ASC);

