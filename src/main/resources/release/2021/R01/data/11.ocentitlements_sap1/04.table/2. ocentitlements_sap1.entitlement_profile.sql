CREATE TABLE ocentitlements_sap1.entitlement_profile(
    ep_profile_id BIGINT NOT NULL,
    ep_version SMALLINT NOT NULL,
    ep_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    ep_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    ep_profile_type CHARACTER VARYING(25) NOT NULL,
    ep_description CHARACTER VARYING(120) NOT NULL,
    ep_status CHARACTER VARYING(10) NOT NULL,
    ep_published_timestamp TIMESTAMP(6) WITHOUT TIME ZONE,
    ep_data_owner CHARACTER VARYING(12) NOT NULL,
    ep_modified_by CHARACTER VARYING(12) NOT NULL,
    ep_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    ep_company_code CHARACTER VARYING(4) NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN ocentitlements_sap1.entitlement_profile.ep_profile_id
     IS 'Profile unique id.';
COMMENT ON COLUMN ocentitlements_sap1.entitlement_profile.ep_version
     IS 'Profile version number.';
COMMENT ON COLUMN ocentitlements_sap1.entitlement_profile.ep_eff_date
     IS 'Profile effective date.';
COMMENT ON COLUMN ocentitlements_sap1.entitlement_profile.ep_end_date
     IS 'Profile end date.';
COMMENT ON COLUMN ocentitlements_sap1.entitlement_profile.ep_profile_type
     IS 'Profile type.';
COMMENT ON COLUMN ocentitlements_sap1.entitlement_profile.ep_description
     IS 'Profile description.';
COMMENT ON COLUMN ocentitlements_sap1.entitlement_profile.ep_status
     IS 'Profile status - DRAFT or PUBLISHED.';
COMMENT ON COLUMN ocentitlements_sap1.entitlement_profile.ep_published_timestamp
     IS 'Timestamp the profile is first published.';
COMMENT ON COLUMN ocentitlements_sap1.entitlement_profile.ep_data_owner
     IS 'Profile data owner.';
COMMENT ON COLUMN ocentitlements_sap1.entitlement_profile.ep_modified_by
     IS 'User or system performing modification.';
COMMENT ON COLUMN ocentitlements_sap1.entitlement_profile.ep_mod_timestamp
     IS 'Timestamp when last modified.';
COMMENT ON COLUMN ocentitlements_sap1.entitlement_profile.ep_company_code
     IS 'Company Code used to create the profile.';

