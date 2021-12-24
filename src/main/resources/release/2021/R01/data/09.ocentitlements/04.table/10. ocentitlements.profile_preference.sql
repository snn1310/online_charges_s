CREATE TABLE ocentitlements.profile_preference(
    psg_id CHARACTER VARYING(33) NOT NULL,
    pp_name CHARACTER VARYING(50) NOT NULL,
    pp_path CHARACTER VARYING(256) NOT NULL,
    pp_value CHARACTER VARYING(256) NOT NULL,
    pp_modified_by CHARACTER VARYING(12) NOT NULL,
    pp_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN ocentitlements.profile_preference.psg_id
     IS 'Profile security group GUID.';
COMMENT ON COLUMN ocentitlements.profile_preference.pp_name
     IS 'Preference name.';
COMMENT ON COLUMN ocentitlements.profile_preference.pp_path
     IS 'Preference path.';
COMMENT ON COLUMN ocentitlements.profile_preference.pp_value
     IS 'Preference value.';
COMMENT ON COLUMN ocentitlements.profile_preference.pp_modified_by
     IS 'User or system performing modification.';
COMMENT ON COLUMN ocentitlements.profile_preference.pp_mod_timestamp
     IS 'Timestamp when last modified.';

