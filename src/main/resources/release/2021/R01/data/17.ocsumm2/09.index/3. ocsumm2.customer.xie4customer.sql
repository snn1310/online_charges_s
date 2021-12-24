CREATE UNIQUE INDEX xie4customer
ON ocsumm2.customer
USING BTREE (c_date ASC, c_user_id ASC, c_id ASC);

