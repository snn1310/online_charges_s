CREATE INDEX idx050204083616644
ON ocprice.sub_material_num
USING BTREE (smn_sub_mat_num ASC, smn_company_code ASC, c_domain ASC, smn_eff_date ASC, smn_end_date ASC, smn_level_value ASC, smn_level_code ASC);

