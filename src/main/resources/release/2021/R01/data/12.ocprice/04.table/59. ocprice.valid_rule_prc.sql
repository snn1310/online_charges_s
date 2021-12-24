CREATE TABLE ocprice.valid_rule_prc(
    vrp_domain CHARACTER VARYING(15) NOT NULL,
    vrp_table_name CHARACTER VARYING(30) NOT NULL,
    vrp_column_name CHARACTER VARYING(30) NOT NULL,
    vrp_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    vrp_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    vrp_value_rule CHARACTER VARYING(50) NOT NULL,
    vrp_company_code CHARACTER VARYING(4) NOT NULL,
    vrp_modified_by CHARACTER VARYING(12) NOT NULL,
    vrp_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocprice.valid_rule_prc
     IS 'Pricing Database Valid Rule Information';
COMMENT ON COLUMN ocprice.valid_rule_prc.vrp_domain
     IS 'Domain.';
COMMENT ON COLUMN ocprice.valid_rule_prc.vrp_table_name
     IS 'Database table name.';
COMMENT ON COLUMN ocprice.valid_rule_prc.vrp_column_name
     IS 'Database column name.';
COMMENT ON COLUMN ocprice.valid_rule_prc.vrp_eff_date
     IS 'Effective date.';
COMMENT ON COLUMN ocprice.valid_rule_prc.vrp_end_date
     IS 'End date.';
COMMENT ON COLUMN ocprice.valid_rule_prc.vrp_value_rule
     IS 'Value rule.';
COMMENT ON COLUMN ocprice.valid_rule_prc.vrp_company_code
     IS 'Company code.';
COMMENT ON COLUMN ocprice.valid_rule_prc.vrp_modified_by
     IS 'Modified by.';
COMMENT ON COLUMN ocprice.valid_rule_prc.vrp_mod_timestamp
     IS 'Modified timestamp.';

