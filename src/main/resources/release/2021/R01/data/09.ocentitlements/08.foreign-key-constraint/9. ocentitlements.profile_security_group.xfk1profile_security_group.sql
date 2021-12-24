ALTER TABLE ocentitlements.profile_security_group
ADD CONSTRAINT xfk1profile_security_group FOREIGN KEY (ep_profile_id, ep_version) 
REFERENCES ocentitlements.entitlement_profile (ep_profile_id, ep_version)
ON DELETE NO ACTION;

