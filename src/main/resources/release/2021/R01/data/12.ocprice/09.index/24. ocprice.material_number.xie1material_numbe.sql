CREATE INDEX xie1material_numbe
ON ocprice.material_number
USING BTREE (mn_mat_num ASC, mn_company_code ASC, mn_eff_date ASC, mn_end_date ASC);

