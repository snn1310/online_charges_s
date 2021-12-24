ALTER TABLE ocprice.sub_material_num
ADD CONSTRAINT xpksub_material_nu PRIMARY KEY (c_domain, smn_sub_mat_num, c_content_id, smn_level_code, smn_level_value, smn_eff_date);

