CREATE INDEX xie1subscription
ON ocprice.subscription
USING BTREE (s_level_code ASC, s_eff_date ASC, s_end_date ASC);

