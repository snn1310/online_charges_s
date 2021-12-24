ALTER TABLE ocentitlements_sap1.profile_security_group
ADD CONSTRAINT xfk1profile_security_group FOREIGN KEY (ep_profile_id, ep_version) 
REFERENCES ocentitlements_sap1.entitlement_profile (ep_profile_id, ep_version)
ON DELETE NO ACTION;

