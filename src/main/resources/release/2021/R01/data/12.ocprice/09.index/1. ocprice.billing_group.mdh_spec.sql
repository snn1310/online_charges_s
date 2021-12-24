CREATE INDEX mdh_spec
ON ocprice.billing_group
USING BTREE (bg_end_date ASC);

