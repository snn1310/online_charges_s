ALTER TABLE ocentitlements.profile_user_limit
ADD CONSTRAINT xfkprofile_user_limit FOREIGN KEY (psg_id) 
REFERENCES ocentitlements.profile_security_group (psg_id)
ON DELETE NO ACTION;

