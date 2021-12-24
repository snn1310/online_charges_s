ALTER TABLE ocentitlements_sap1.profile_instance_data
ADD CONSTRAINT xfk2profile_instance_data FOREIGN KEY (ep_profile_id, ep_version) 
REFERENCES ocentitlements_sap1.entitlement_profile (ep_profile_id, ep_version)
ON DELETE NO ACTION;

