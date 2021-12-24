ALTER TABLE ocentitlements.profile_instance_data
ADD CONSTRAINT xfk2profile_instance_data FOREIGN KEY (ep_profile_id, ep_version) 
REFERENCES ocentitlements.entitlement_profile (ep_profile_id, ep_version)
ON DELETE NO ACTION;

