ALTER TABLE ocprice.quantity_discount
ADD CONSTRAINT xpkquantity_discou PRIMARY KEY (qd_domain, qd_level_code, qd_level_value, qd_eff_date);

