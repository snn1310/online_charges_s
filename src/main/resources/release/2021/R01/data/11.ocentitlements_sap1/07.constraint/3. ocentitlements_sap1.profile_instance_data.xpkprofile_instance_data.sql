ALTER TABLE ocentitlements_sap1.profile_instance_data
ADD CONSTRAINT xpkprofile_instance_data PRIMARY KEY (sg_security_group_id, sg_domain, pid_level_code, pid_level_value, ep_profile_id, ep_version, pid_eff_date);

