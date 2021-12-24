CREATE INDEX xie1password_expiration
ON ocprice.password_expiration
USING BTREE (pe_level_code ASC, pe_level_value ASC, pe_domain ASC, pe_company_code ASC, pe_eff_date ASC, pe_end_date ASC, pe_period ASC, pe_reason_code ASC, pe_modified_by ASC, pe_mod_timestamp ASC);

