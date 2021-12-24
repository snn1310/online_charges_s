CREATE INDEX billing_group_ndx2
ON ocprice.billing_group
USING BTREE (bg_mod_timestamp ASC);

