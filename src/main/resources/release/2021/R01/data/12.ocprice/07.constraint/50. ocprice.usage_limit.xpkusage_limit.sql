ALTER TABLE ocprice.usage_limit
ADD CONSTRAINT xpkusage_limit PRIMARY KEY (ul_domain, ul_level_code, ul_level_value, ul_eff_date);

