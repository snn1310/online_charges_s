ALTER TABLE ocentitlements_sap1.profile_preference
ADD CONSTRAINT xfkprofile_preference FOREIGN KEY (psg_id) 
REFERENCES ocentitlements_sap1.profile_security_group (psg_id)
ON DELETE NO ACTION;

