CREATE TABLE ocprice.user_adjustment(
    ua_sub_mat_num CHARACTER VARYING(18) NOT NULL,
    ua_domain CHARACTER VARYING(15) NOT NULL,
    ua_adjust_type CHARACTER VARYING(18) NOT NULL,
    ua_adjust_value CHARACTER VARYING(50) NOT NULL,
    ua_registration_type CHARACTER VARYING(15) NOT NULL,
    ua_source_id CHARACTER VARYING(10) NOT NULL,
    ua_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    ua_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    ua_action CHARACTER VARYING(10) NOT NULL,
    ua_modified_by CHARACTER VARYING(12) NOT NULL,
    ua_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN ocprice.user_adjustment.ua_sub_mat_num
     IS 'Subscription Material Number';
COMMENT ON COLUMN ocprice.user_adjustment.ua_domain
     IS 'Domain';
COMMENT ON COLUMN ocprice.user_adjustment.ua_adjust_type
     IS 'Adjustment Type';
COMMENT ON COLUMN ocprice.user_adjustment.ua_adjust_value
     IS 'Adjustment Value';
COMMENT ON COLUMN ocprice.user_adjustment.ua_registration_type
     IS 'Registration Type';
COMMENT ON COLUMN ocprice.user_adjustment.ua_source_id
     IS 'Source ID';
COMMENT ON COLUMN ocprice.user_adjustment.ua_eff_date
     IS 'Effective Date';
COMMENT ON COLUMN ocprice.user_adjustment.ua_end_date
     IS 'End Date';
COMMENT ON COLUMN ocprice.user_adjustment.ua_action
     IS 'Action';
COMMENT ON COLUMN ocprice.user_adjustment.ua_modified_by
     IS 'Modified By';
COMMENT ON COLUMN ocprice.user_adjustment.ua_mod_timestamp
     IS 'Modified Timestamp';

