CREATE TABLE ocprice.valid_value_prc(
    vvp_domain CHARACTER VARYING(15) NOT NULL,
    vvp_value_rule CHARACTER VARYING(18) NOT NULL,
    vvp_valid_value CHARACTER VARYING(18) NOT NULL,
    vvp_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    vvp_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    vvp_value_desc CHARACTER VARYING(40) NOT NULL,
    vvp_company_code CHARACTER VARYING(4) NOT NULL,
    vvp_modified_by CHARACTER VARYING(12) NOT NULL,
    vvp_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocprice.valid_value_prc
     IS 'Pricing Database Valid Value Information';
COMMENT ON COLUMN ocprice.valid_value_prc.vvp_domain
     IS 'Domain.';
COMMENT ON COLUMN ocprice.valid_value_prc.vvp_value_rule
     IS 'Valid value rule.';
COMMENT ON COLUMN ocprice.valid_value_prc.vvp_valid_value
     IS 'Valid value.';
COMMENT ON COLUMN ocprice.valid_value_prc.vvp_eff_date
     IS 'Effective date.';
COMMENT ON COLUMN ocprice.valid_value_prc.vvp_end_date
     IS 'End date.';
COMMENT ON COLUMN ocprice.valid_value_prc.vvp_value_desc
     IS 'Value description.';
COMMENT ON COLUMN ocprice.valid_value_prc.vvp_modified_by
     IS 'Modified by.';
COMMENT ON COLUMN ocprice.valid_value_prc.vvp_mod_timestamp
     IS 'Modified timestamp.';

