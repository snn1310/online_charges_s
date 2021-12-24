ALTER TABLE ccdetail.limit_accumulation
ADD CONSTRAINT xpklimit_accumulation PRIMARY KEY (la_domain, la_eff_date, la_usage_type, la_unit, la_level_code, la_level_value);

