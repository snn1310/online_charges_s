CREATE INDEX xie2discount
ON ocsumm1.discount
USING BTREE (d_company_id ASC, d_date ASC);

