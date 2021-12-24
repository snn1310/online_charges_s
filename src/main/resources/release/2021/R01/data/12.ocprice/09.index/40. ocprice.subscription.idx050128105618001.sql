CREATE INDEX idx050128105618001
ON ocprice.subscription
USING BTREE (s_level_value ASC, s_sub_type ASC, s_level_code ASC, s_domain ASC, s_company_code ASC, s_eff_date ASC, s_end_date ASC);

