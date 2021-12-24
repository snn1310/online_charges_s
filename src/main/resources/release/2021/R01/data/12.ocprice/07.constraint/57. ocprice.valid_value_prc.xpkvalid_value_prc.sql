ALTER TABLE ocprice.valid_value_prc
ADD CONSTRAINT xpkvalid_value_prc PRIMARY KEY (vvp_domain, vvp_value_rule, vvp_valid_value, vvp_eff_date);

