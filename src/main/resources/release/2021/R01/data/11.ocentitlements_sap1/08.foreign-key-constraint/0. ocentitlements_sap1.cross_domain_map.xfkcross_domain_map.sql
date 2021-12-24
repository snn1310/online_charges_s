ALTER TABLE ocentitlements_sap1.cross_domain_map
ADD CONSTRAINT xfkcross_domain_map FOREIGN KEY (sg_security_group_id, sg_domain) 
REFERENCES ocentitlements_sap1.security_group (sg_security_group_id, sg_domain)
ON DELETE NO ACTION;

