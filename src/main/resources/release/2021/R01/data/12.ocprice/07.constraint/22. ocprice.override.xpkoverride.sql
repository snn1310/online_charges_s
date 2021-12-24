ALTER TABLE ocprice.override
ADD CONSTRAINT xpkoverride PRIMARY KEY (c_domain, o_level_code, o_level_value, c_content_id, o_eff_date);

