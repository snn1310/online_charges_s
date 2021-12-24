CREATE INDEX xie2trial
ON ocprice.trial
USING BTREE (t_bill_grp ASC, t_eff_date ASC, t_end_date ASC, t_offer_id ASC);

