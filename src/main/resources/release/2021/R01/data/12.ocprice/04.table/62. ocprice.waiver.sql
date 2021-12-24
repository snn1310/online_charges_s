CREATE TABLE ocprice.waiver(
    w_domain CHARACTER VARYING(15) NOT NULL,
    w_level_code CHARACTER VARYING(18) NOT NULL,
    w_level_value CHARACTER VARYING(33) NOT NULL,
    w_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    w_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    w_cond_type CHARACTER VARYING(4) NOT NULL,
    w_company_code CHARACTER VARYING(4) NOT NULL,
    w_modified_by CHARACTER VARYING(12) NOT NULL,
    w_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocprice.waiver
     IS 'Waiver Information';
COMMENT ON COLUMN ocprice.waiver.w_level_code
     IS 'Level code.';
COMMENT ON COLUMN ocprice.waiver.w_level_value
     IS 'Level value.';
COMMENT ON COLUMN ocprice.waiver.w_eff_date
     IS 'Effective date.';
COMMENT ON COLUMN ocprice.waiver.w_end_date
     IS 'End date.';
COMMENT ON COLUMN ocprice.waiver.w_cond_type
     IS 'Condition type.';
COMMENT ON COLUMN ocprice.waiver.w_company_code
     IS 'Company code.';
COMMENT ON COLUMN ocprice.waiver.w_modified_by
     IS 'Modified by.';
COMMENT ON COLUMN ocprice.waiver.w_mod_timestamp
     IS 'Modified timestamp.';

