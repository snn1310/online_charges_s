ALTER TABLE ocprice.subscription
ADD CONSTRAINT xpksubscription PRIMARY KEY (s_sub_document, s_line_item, s_level_code, s_level_value, s_eff_date);

