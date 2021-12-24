CREATE TABLE ocentitlements.profile_user_limit(
    psg_id CHARACTER VARYING(33) NOT NULL,
    pul_level_code CHARACTER VARYING(18) NOT NULL,
    pul_usage_type CHARACTER VARYING(3) NOT NULL,
    pul_unit CHARACTER VARYING(15) NOT NULL,
    pul_amount INTEGER NOT NULL,
    pul_reset_interval CHARACTER VARYING(15) NOT NULL,
    pul_modified_by CHARACTER VARYING(12) NOT NULL,
    pul_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN ocentitlements.profile_user_limit.psg_id
     IS 'Profile security group GUID.';
COMMENT ON COLUMN ocentitlements.profile_user_limit.pul_level_code
     IS 'User limit level code.';
COMMENT ON COLUMN ocentitlements.profile_user_limit.pul_usage_type
     IS 'User limit usage type.';
COMMENT ON COLUMN ocentitlements.profile_user_limit.pul_unit
     IS 'User limit unit.';
COMMENT ON COLUMN ocentitlements.profile_user_limit.pul_amount
     IS 'User limit amount.';
COMMENT ON COLUMN ocentitlements.profile_user_limit.pul_reset_interval
     IS 'User limit reset interval.';
COMMENT ON COLUMN ocentitlements.profile_user_limit.pul_modified_by
     IS 'User or system performing modification.';
COMMENT ON COLUMN ocentitlements.profile_user_limit.pul_mod_timestamp
     IS 'Timestamp when last modified.';

