CREATE INDEX idx050203140019001
ON ocprice.database_group
USING BTREE (dg_database_name ASC, dg_domain ASC, dg_company_code ASC, dg_eff_date ASC, dg_end_date ASC, dg_grp_mat_num ASC, dg_modified_by ASC, dg_mod_timestamp ASC);

