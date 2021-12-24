CREATE TABLE ocentitlements_sap1.profile_security_group(
    psg_id CHARACTER VARYING(33) NOT NULL,
    ep_profile_id BIGINT NOT NULL,
    ep_version SMALLINT NOT NULL,
    psg_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    psg_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    sg_security_group_id CHARACTER VARYING(15) NOT NULL,
    sg_domain CHARACTER VARYING(15) NOT NULL,
    psg_customer_type SMALLINT,
    psg_promotion_number CHARACTER VARYING(8),
    psg_modified_by CHARACTER VARYING(12) NOT NULL,
    psg_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    psg_company_code CHARACTER VARYING(4) NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN ocentitlements_sap1.profile_security_group.psg_id
     IS 'Profile security group GUID.';
COMMENT ON COLUMN ocentitlements_sap1.profile_security_group.ep_profile_id
     IS 'Profile unique id.';
COMMENT ON COLUMN ocentitlements_sap1.profile_security_group.ep_version
     IS 'Profile version number.';
COMMENT ON COLUMN ocentitlements_sap1.profile_security_group.psg_eff_date
     IS 'Profile group effective date.';
COMMENT ON COLUMN ocentitlements_sap1.profile_security_group.psg_end_date
     IS 'Profile group end date.';
COMMENT ON COLUMN ocentitlements_sap1.profile_security_group.sg_security_group_id
     IS 'Security group ID.';
COMMENT ON COLUMN ocentitlements_sap1.profile_security_group.sg_domain
     IS 'Security group domain.';
COMMENT ON COLUMN ocentitlements_sap1.profile_security_group.psg_customer_type
     IS 'SAP Customer Type (used for CC groups).';
COMMENT ON COLUMN ocentitlements_sap1.profile_security_group.psg_promotion_number
     IS 'Promotion Number (used for PG groups).';
COMMENT ON COLUMN ocentitlements_sap1.profile_security_group.psg_modified_by
     IS 'User or system performing modification.';
COMMENT ON COLUMN ocentitlements_sap1.profile_security_group.psg_mod_timestamp
     IS 'Timestamp when last modified.';
COMMENT ON COLUMN ocentitlements_sap1.profile_security_group.psg_company_code
     IS 'Company Code used to create the profile.';

