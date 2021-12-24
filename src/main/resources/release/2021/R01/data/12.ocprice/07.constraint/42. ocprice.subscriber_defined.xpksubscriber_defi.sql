ALTER TABLE ocprice.subscriber_defined
ADD CONSTRAINT xpksubscriber_defi PRIMARY KEY (c_domain, sd_level_code, sd_level_value, c_content_id, sd_eff_date);

