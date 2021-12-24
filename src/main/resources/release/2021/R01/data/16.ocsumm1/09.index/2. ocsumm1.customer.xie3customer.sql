CREATE UNIQUE INDEX xie3customer
ON ocsumm1.customer
USING BTREE (c_date ASC, c_user_id ASC, c_company_id ASC);

