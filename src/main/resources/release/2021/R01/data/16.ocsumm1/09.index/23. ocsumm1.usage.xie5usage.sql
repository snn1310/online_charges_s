CREATE INDEX xie5usage
ON ocsumm1.usage
USING BTREE (c_id ASC, u_company_id ASC, u_database_name ASC);

