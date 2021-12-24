CREATE INDEX xie5usage
ON ocsumm2.usage
USING BTREE (c_id ASC, u_company_id ASC, u_database_name ASC);

