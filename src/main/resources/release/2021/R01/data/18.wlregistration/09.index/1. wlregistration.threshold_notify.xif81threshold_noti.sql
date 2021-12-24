CREATE INDEX xif81threshold_noti
ON wlregistration.threshold_notify
USING BTREE (pt_company_code ASC, pt_pwd_type ASC);

