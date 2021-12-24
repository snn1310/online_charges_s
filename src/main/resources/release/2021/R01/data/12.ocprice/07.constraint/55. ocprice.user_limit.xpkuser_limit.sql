ALTER TABLE ocprice.user_limit
ADD CONSTRAINT xpkuser_limit PRIMARY KEY (ul_domain, ul_level_code, ul_level_value, ul_eff_date, ul_usage_type, ul_unit);

