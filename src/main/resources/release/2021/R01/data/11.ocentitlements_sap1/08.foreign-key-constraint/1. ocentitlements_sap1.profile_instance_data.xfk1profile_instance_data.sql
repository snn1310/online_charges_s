ALTER TABLE ocentitlements_sap1.profile_instance_data
ADD CONSTRAINT xfk1profile_instance_data FOREIGN KEY (sg_security_group_id, sg_domain) 
REFERENCES ocentitlements_sap1.security_group (sg_security_group_id, sg_domain)
ON DELETE NO ACTION;

