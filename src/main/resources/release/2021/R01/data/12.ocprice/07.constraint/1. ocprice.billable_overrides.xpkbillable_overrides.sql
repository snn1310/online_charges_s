ALTER TABLE ocprice.billable_overrides
ADD CONSTRAINT xpkbillable_overrides PRIMARY KEY (bo_level_code, bo_level_value, bo_type, bo_eff_date, bo_id);

