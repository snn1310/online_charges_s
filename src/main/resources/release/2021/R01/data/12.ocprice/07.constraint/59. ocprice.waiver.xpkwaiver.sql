ALTER TABLE ocprice.waiver
ADD CONSTRAINT xpkwaiver PRIMARY KEY (w_domain, w_level_code, w_level_value, w_eff_date);

