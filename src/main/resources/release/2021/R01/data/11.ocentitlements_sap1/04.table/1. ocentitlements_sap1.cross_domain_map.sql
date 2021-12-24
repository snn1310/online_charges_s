CREATE TABLE ocentitlements_sap1.cross_domain_map(
    sg_security_group_id CHARACTER VARYING(15) NOT NULL,
    sg_domain CHARACTER VARYING(15) NOT NULL,
    cdm_version SMALLINT NOT NULL,
    cdm_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    cdm_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    cdm_dep_security_group_id CHARACTER VARYING(15) NOT NULL,
    cdm_dep_domain CHARACTER VARYING(15) NOT NULL,
    cdm_modified_by CHARACTER VARYING(12) NOT NULL,
    cdm_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    cdm_company_code CHARACTER VARYING(4)
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN ocentitlements_sap1.cross_domain_map.sg_security_group_id
     IS 'Cross domain group ID.';
COMMENT ON COLUMN ocentitlements_sap1.cross_domain_map.sg_domain
     IS 'Cross domain group domain.';
COMMENT ON COLUMN ocentitlements_sap1.cross_domain_map.cdm_version
     IS 'Cross domain map version.';
COMMENT ON COLUMN ocentitlements_sap1.cross_domain_map.cdm_eff_date
     IS 'Dependent group effective date in the map.';
COMMENT ON COLUMN ocentitlements_sap1.cross_domain_map.cdm_end_date
     IS 'Dependent group end date in the map.';
COMMENT ON COLUMN ocentitlements_sap1.cross_domain_map.cdm_dep_security_group_id
     IS 'Dependent group Prism id.';
COMMENT ON COLUMN ocentitlements_sap1.cross_domain_map.cdm_dep_domain
     IS 'Dependent group domain.';
COMMENT ON COLUMN ocentitlements_sap1.cross_domain_map.cdm_modified_by
     IS 'User or system performing modification.';
COMMENT ON COLUMN ocentitlements_sap1.cross_domain_map.cdm_mod_timestamp
     IS 'Timestamp when last modified.';
COMMENT ON COLUMN ocentitlements_sap1.cross_domain_map.cdm_company_code
     IS 'Company Code used to create the profile.';

