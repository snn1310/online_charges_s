ALTER TABLE ocentitlements.profile_preference
ADD CONSTRAINT xfkprofile_preference FOREIGN KEY (psg_id) 
REFERENCES ocentitlements.profile_security_group (psg_id)
ON DELETE NO ACTION;

