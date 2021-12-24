CREATE UNIQUE INDEX xpkcontent_day
ON ocanalytics.content_day
USING BTREE (cd_id ASC, cd_date ASC);

