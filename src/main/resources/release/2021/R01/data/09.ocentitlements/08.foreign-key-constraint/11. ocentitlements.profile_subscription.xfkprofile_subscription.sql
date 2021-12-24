ALTER TABLE ocentitlements.profile_subscription
ADD CONSTRAINT xfkprofile_subscription FOREIGN KEY (psg_id) 
REFERENCES ocentitlements.profile_security_group (psg_id)
ON DELETE NO ACTION;

