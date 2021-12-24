ALTER TABLE wlregistration.threshold_notify
ADD CONSTRAINT xpkthreshold_notif PRIMARY KEY (pt_company_code, pt_pwd_type, tn_email);

