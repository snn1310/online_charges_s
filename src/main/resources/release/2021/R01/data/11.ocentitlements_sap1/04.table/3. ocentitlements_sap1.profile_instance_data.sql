CREATE TABLE ocentitlements_sap1.profile_instance_data(
    sg_security_group_id CHARACTER VARYING(15) NOT NULL,
    sg_domain CHARACTER VARYING(15) NOT NULL,
    pid_level_code CHARACTER VARYING(18) NOT NULL,
    pid_level_value CHARACTER VARYING(33) NOT NULL,
    ep_profile_id BIGINT NOT NULL,
    ep_version SMALLINT NOT NULL,
    pid_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    pid_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    pid_security_group_type CHARACTER VARYING(2) NOT NULL,
    pid_data_owner CHARACTER VARYING(12) NOT NULL,
    pid_offer_id CHARACTER VARYING(33),
    pid_offer_channel CHARACTER VARYING(10),
    pid_modified_by CHARACTER VARYING(12) NOT NULL,
    pid_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN ocentitlements_sap1.profile_instance_data.sg_security_group_id
     IS 'Security group ID.';
COMMENT ON COLUMN ocentitlements_sap1.profile_instance_data.sg_domain
     IS 'Security group domain.';
COMMENT ON COLUMN ocentitlements_sap1.profile_instance_data.pid_level_code
     IS 'Level code for the data (USER or BILLING GROUP).';
COMMENT ON COLUMN ocentitlements_sap1.profile_instance_data.pid_level_value
     IS 'Level value (user guid or billing group id).';
COMMENT ON COLUMN ocentitlements_sap1.profile_instance_data.ep_profile_id
     IS 'Profile unique id.';
COMMENT ON COLUMN ocentitlements_sap1.profile_instance_data.ep_version
     IS 'Profile version number.';
COMMENT ON COLUMN ocentitlements_sap1.profile_instance_data.pid_eff_date
     IS 'Entitlement or group effective date in the map.';
COMMENT ON COLUMN ocentitlements_sap1.profile_instance_data.pid_end_date
     IS 'Entitlement or group end date in the map.';
COMMENT ON COLUMN ocentitlements_sap1.profile_instance_data.pid_security_group_type
     IS 'Group type for the Security Group in the primary key.';
COMMENT ON COLUMN ocentitlements_sap1.profile_instance_data.pid_data_owner
     IS 'Data Owner.';
COMMENT ON COLUMN ocentitlements_sap1.profile_instance_data.pid_offer_id
     IS 'Offer Id.';
COMMENT ON COLUMN ocentitlements_sap1.profile_instance_data.pid_offer_channel
     IS 'Offer Channel.';
COMMENT ON COLUMN ocentitlements_sap1.profile_instance_data.pid_modified_by
     IS 'User or system performing modification.';
COMMENT ON COLUMN ocentitlements_sap1.profile_instance_data.pid_mod_timestamp
     IS 'Timestamp when last modified.';

