ALTER TABLE ocprice.password_expiration
ADD CONSTRAINT xpkpassword_expiration PRIMARY KEY (pe_level_code, pe_level_value, pe_domain, pe_company_code, pe_eff_date, pe_rule_name);

