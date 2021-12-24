CREATE UNIQUE INDEX xpkjurisdiction_day
ON ocanalytics.jurisdiction_day
USING BTREE (jd_id ASC, jd_date ASC);

