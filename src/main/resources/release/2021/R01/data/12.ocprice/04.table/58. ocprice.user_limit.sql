CREATE TABLE ocprice.user_limit(
    ul_domain CHARACTER VARYING(15) NOT NULL,
    ul_level_code CHARACTER VARYING(18) NOT NULL,
    ul_level_value CHARACTER VARYING(33) NOT NULL,
    ul_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    ul_usage_type CHARACTER VARYING(3) NOT NULL,
    ul_unit CHARACTER VARYING(15) NOT NULL,
    ul_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    ul_reset_interval CHARACTER VARYING(15) NOT NULL,
    ul_amount INTEGER NOT NULL,
    ul_modified_by CHARACTER VARYING(12) NOT NULL,
    ul_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    ul_offer_id CHARACTER VARYING(33),
    ul_data_owner CHARACTER VARYING(12) NOT NULL DEFAULT 'SAP'
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN ocprice.user_limit.ul_domain
     IS 'Domain the User ID belongs to.';
COMMENT ON COLUMN ocprice.user_limit.ul_level_code
     IS 'Level code.';
COMMENT ON COLUMN ocprice.user_limit.ul_level_value
     IS 'Level value.';
COMMENT ON COLUMN ocprice.user_limit.ul_eff_date
     IS 'Date on which the limit is first effective.';
COMMENT ON COLUMN ocprice.user_limit.ul_usage_type
     IS 'Usage Type to which the limit applies.';
COMMENT ON COLUMN ocprice.user_limit.ul_unit
     IS 'Unit of measure for the limit.';
COMMENT ON COLUMN ocprice.user_limit.ul_end_date
     IS 'Date on which the limit ends.';
COMMENT ON COLUMN ocprice.user_limit.ul_reset_interval
     IS 'Indicates what date the limit should be reset.';
COMMENT ON COLUMN ocprice.user_limit.ul_amount
     IS 'The limit amount.';
COMMENT ON COLUMN ocprice.user_limit.ul_modified_by
     IS 'The last user to modify the limit.';
COMMENT ON COLUMN ocprice.user_limit.ul_mod_timestamp
     IS 'The time of the last limit modification.';

