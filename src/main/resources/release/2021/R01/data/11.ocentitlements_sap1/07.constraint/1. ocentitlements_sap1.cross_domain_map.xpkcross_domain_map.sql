ALTER TABLE ocentitlements_sap1.cross_domain_map
ADD CONSTRAINT xpkcross_domain_map PRIMARY KEY (sg_security_group_id, sg_domain, cdm_version, cdm_dep_security_group_id, cdm_dep_domain, cdm_eff_date);

