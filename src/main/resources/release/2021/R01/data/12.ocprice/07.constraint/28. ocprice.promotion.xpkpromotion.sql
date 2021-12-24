ALTER TABLE ocprice.promotion
ADD CONSTRAINT xpkpromotion PRIMARY KEY (p_domain, p_promo_num, p_level_code, p_level_value, p_eff_date);

