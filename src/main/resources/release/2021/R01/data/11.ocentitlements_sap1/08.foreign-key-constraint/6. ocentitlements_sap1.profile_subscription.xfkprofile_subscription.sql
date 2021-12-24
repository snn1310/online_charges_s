ALTER TABLE ocentitlements_sap1.profile_subscription
ADD CONSTRAINT xfkprofile_subscription FOREIGN KEY (psg_id) 
REFERENCES ocentitlements_sap1.profile_security_group (psg_id)
ON DELETE NO ACTION;

