ALTER TABLE ocentitlements_sap1.profile_user_limit
ADD CONSTRAINT xfkprofile_user_limit FOREIGN KEY (psg_id) 
REFERENCES ocentitlements_sap1.profile_security_group (psg_id)
ON DELETE NO ACTION;

