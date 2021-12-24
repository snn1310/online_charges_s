ALTER TABLE ocprice.usage_type
ADD CONSTRAINT xpkusage_type PRIMARY KEY (ut_domain, ut_usage_type_name, ut_eff_date);

