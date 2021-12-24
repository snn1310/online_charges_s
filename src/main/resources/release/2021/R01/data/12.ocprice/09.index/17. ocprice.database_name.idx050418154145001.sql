CREATE INDEX idx050418154145001
ON ocprice.database_name
USING BTREE (dn_db_mat_num ASC, dn_domain ASC, dn_company_code ASC, dn_eff_date ASC, dn_end_date ASC);

