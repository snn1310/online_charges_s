ALTER TABLE ocentitlements_sap1.profile_security_group
ADD CONSTRAINT xfk2profile_security_group FOREIGN KEY (sg_security_group_id, sg_domain) 
REFERENCES ocentitlements_sap1.security_group (sg_security_group_id, sg_domain)
ON DELETE NO ACTION;

