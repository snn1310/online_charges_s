ALTER TABLE ocprice.valid_rule_prc
ADD CONSTRAINT xpkvalid_rule_prc PRIMARY KEY (vrp_domain, vrp_table_name, vrp_column_name, vrp_eff_date);

