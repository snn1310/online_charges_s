CREATE TABLE ocprice.usage_limit(
    ul_domain CHARACTER VARYING(15) NOT NULL,
    ul_level_code CHARACTER VARYING(18) NOT NULL,
    ul_level_value CHARACTER VARYING(33) NOT NULL,
    ul_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    ul_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    ul_company_code CHARACTER VARYING(4) NOT NULL,
    ul_modified_by CHARACTER VARYING(12) NOT NULL,
    ul_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocprice.usage_limit
     IS 'Usage Limit Information';
COMMENT ON COLUMN ocprice.usage_limit.ul_level_code
     IS 'Level code.';
COMMENT ON COLUMN ocprice.usage_limit.ul_level_value
     IS 'Level value.';
COMMENT ON COLUMN ocprice.usage_limit.ul_eff_date
     IS 'Effective date.';
COMMENT ON COLUMN ocprice.usage_limit.ul_end_date
     IS 'End date.';
COMMENT ON COLUMN ocprice.usage_limit.ul_company_code
     IS 'Company code.';
COMMENT ON COLUMN ocprice.usage_limit.ul_modified_by
     IS 'Modified by (e.g. business system user name, pricing formating process name).';
COMMENT ON COLUMN ocprice.usage_limit.ul_mod_timestamp
     IS 'Modified timestamp.';

