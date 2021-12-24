CREATE INDEX xfk1usage_day
ON ocanalytics.usage_day
USING BTREE (ud_product_group ASC);

