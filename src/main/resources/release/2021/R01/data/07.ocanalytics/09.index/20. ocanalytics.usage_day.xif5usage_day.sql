CREATE INDEX xif5usage_day
ON ocanalytics.usage_day
USING BTREE (ud_bill_grp ASC, ud_date ASC);

