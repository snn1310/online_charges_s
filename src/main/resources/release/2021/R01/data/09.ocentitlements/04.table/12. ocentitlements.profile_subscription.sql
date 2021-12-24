CREATE TABLE ocentitlements.profile_subscription(
    psg_id CHARACTER VARYING(33) NOT NULL,
    ps_sub_mat_num CHARACTER VARYING(18) NOT NULL,
    ps_company_code CHARACTER VARYING(4) NOT NULL,
    ps_limit_type CHARACTER VARYING(15),
    ps_limit_amount BIGINT,
    ps_modified_by CHARACTER VARYING(12) NOT NULL,
    ps_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN ocentitlements.profile_subscription.psg_id
     IS 'Profile security group GUID.';
COMMENT ON COLUMN ocentitlements.profile_subscription.ps_sub_mat_num
     IS 'Subscription material number.';
COMMENT ON COLUMN ocentitlements.profile_subscription.ps_company_code
     IS 'Subscription Company Code.';
COMMENT ON COLUMN ocentitlements.profile_subscription.ps_limit_type
     IS 'Subscription limit type -used for  Data room subs.';
COMMENT ON COLUMN ocentitlements.profile_subscription.ps_limit_amount
     IS 'Subscription limit amount  -used for  Data room subs.';
COMMENT ON COLUMN ocentitlements.profile_subscription.ps_modified_by
     IS 'User or system performing modification.';
COMMENT ON COLUMN ocentitlements.profile_subscription.ps_mod_timestamp
     IS 'Timestamp when last modified.';

