ALTER TABLE ocprice.rule_instance_value
ADD CONSTRAINT xpkrule_instance_value PRIMARY KEY (ri_id, riv_rule_name, riv_attribute_name, riv_value, riv_eff_date);

