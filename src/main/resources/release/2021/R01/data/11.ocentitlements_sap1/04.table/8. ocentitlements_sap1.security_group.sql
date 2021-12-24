CREATE TABLE ocentitlements_sap1.security_group(
    sg_security_group_id CHARACTER VARYING(15) NOT NULL,
    sg_domain CHARACTER VARYING(15) NOT NULL,
    sg_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    sg_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    sg_security_group_type CHARACTER VARYING(2) NOT NULL,
    sg_description CHARACTER VARYING(40) NOT NULL,
    sg_data_owner CHARACTER VARYING(12) NOT NULL,
    sg_modified_by CHARACTER VARYING(12) NOT NULL,
    sg_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    sg_company_code CHARACTER VARYING(4)
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN ocentitlements_sap1.security_group.sg_security_group_id
     IS 'Security group ID.';
COMMENT ON COLUMN ocentitlements_sap1.security_group.sg_domain
     IS 'Security group domain.';
COMMENT ON COLUMN ocentitlements_sap1.security_group.sg_eff_date
     IS 'Prism group effective date.';
COMMENT ON COLUMN ocentitlements_sap1.security_group.sg_end_date
     IS 'Prism group end date.';
COMMENT ON COLUMN ocentitlements_sap1.security_group.sg_security_group_type
     IS 'Prism group type.';
COMMENT ON COLUMN ocentitlements_sap1.security_group.sg_description
     IS 'Security group description.';
COMMENT ON COLUMN ocentitlements_sap1.security_group.sg_data_owner
     IS 'Data owner that created the group.';
COMMENT ON COLUMN ocentitlements_sap1.security_group.sg_modified_by
     IS 'User or system performing modification.';
COMMENT ON COLUMN ocentitlements_sap1.security_group.sg_mod_timestamp
     IS 'Timestamp when last modified.';
COMMENT ON COLUMN ocentitlements_sap1.security_group.sg_company_code
     IS 'Company Code used to create the profile.';

