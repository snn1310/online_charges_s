CREATE INDEX idx050204083458243
ON ocprice.group_material_num
USING BTREE (gmn_price_code ASC, gmn_domain ASC, gmn_company_code ASC, gmn_eff_date ASC, gmn_end_date ASC);

