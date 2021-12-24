ALTER TABLE wlregistration.password
ADD CONSTRAINT xpkpassword PRIMARY KEY (pt_pwd_type, pt_company_code, p_contact_num);

