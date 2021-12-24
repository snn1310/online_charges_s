CREATE INDEX xie3billing_group
ON ocprice.billing_group
USING BTREE (bg_org_partner ASC, bg_eff_date ASC);

