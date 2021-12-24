CREATE INDEX xie1usage_limit
ON ocprice.usage_limit
USING BTREE (ul_level_code ASC, ul_level_value ASC, ul_end_date ASC, ul_eff_date ASC);

