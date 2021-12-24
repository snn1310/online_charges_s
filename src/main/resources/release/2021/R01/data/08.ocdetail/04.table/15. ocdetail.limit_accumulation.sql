CREATE TABLE ocdetail.limit_accumulation(
    la_domain CHARACTER VARYING(15) NOT NULL,
    la_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    la_usage_type CHARACTER VARYING(3) NOT NULL,
    la_unit CHARACTER VARYING(15) NOT NULL,
    la_level_code CHARACTER VARYING(18) NOT NULL,
    la_level_value CHARACTER VARYING(33) NOT NULL,
    la_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    la_accumulated NUMERIC(11,2) NOT NULL,
    la_limit_reached_timestamp TIMESTAMP(6) WITHOUT TIME ZONE
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocdetail.limit_accumulation
     IS 'Limit accumulation.';
COMMENT ON COLUMN ocdetail.limit_accumulation.la_domain
     IS 'Domain the User ID belongs to.';
COMMENT ON COLUMN ocdetail.limit_accumulation.la_eff_date
     IS 'Date on which the limit is first effective.';
COMMENT ON COLUMN ocdetail.limit_accumulation.la_usage_type
     IS 'Usage Type to which the limit applies.';
COMMENT ON COLUMN ocdetail.limit_accumulation.la_unit
     IS 'Unit of measure for the limit';
COMMENT ON COLUMN ocdetail.limit_accumulation.la_end_date
     IS 'Date on which the limit ends.';
COMMENT ON COLUMN ocdetail.limit_accumulation.la_accumulated
     IS 'The amount accumulated.';

