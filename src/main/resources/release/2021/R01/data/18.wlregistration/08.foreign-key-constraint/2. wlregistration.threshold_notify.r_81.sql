ALTER TABLE wlregistration.threshold_notify
ADD CONSTRAINT r_81 FOREIGN KEY (pt_pwd_type, pt_company_code) 
REFERENCES wlregistration.password_type (pt_pwd_type, pt_company_code)
ON DELETE NO ACTION;

