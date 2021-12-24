CREATE INDEX xie2billing_group
ON ocprice.billing_group
USING BTREE (bg_pay_grp ASC, bg_eff_date ASC, bg_end_date ASC);

