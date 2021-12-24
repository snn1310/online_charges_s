CREATE INDEX xif80password
ON wlregistration.password
USING BTREE (pt_company_code ASC, pt_pwd_type ASC);

