CREATE INDEX xie3incl_excl_bill
ON ocprice.subscription
USING BTREE (s_sub_mat_num ASC, s_eff_date ASC, s_end_date ASC);

