CREATE INDEX xie2billing_groupmod
ON ocprice.billing_group
USING BTREE (bg_bill_grp ASC, bg_eff_date ASC, bg_end_date ASC);

