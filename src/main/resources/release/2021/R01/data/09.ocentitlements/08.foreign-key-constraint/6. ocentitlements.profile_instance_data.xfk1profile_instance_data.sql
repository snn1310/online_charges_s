ALTER TABLE ocentitlements.profile_instance_data
ADD CONSTRAINT xfk1profile_instance_data FOREIGN KEY (sg_security_group_id, sg_domain) 
REFERENCES ocentitlements.security_group (sg_security_group_id, sg_domain)
ON DELETE NO ACTION;

