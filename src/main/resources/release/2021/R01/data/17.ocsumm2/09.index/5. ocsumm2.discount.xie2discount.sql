CREATE INDEX xie2discount
ON ocsumm2.discount
USING BTREE (d_company_id ASC, d_date ASC);

