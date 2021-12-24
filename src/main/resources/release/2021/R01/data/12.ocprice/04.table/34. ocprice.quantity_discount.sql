CREATE TABLE ocprice.quantity_discount(
    qd_domain CHARACTER VARYING(15) NOT NULL,
    qd_level_code CHARACTER VARYING(18) NOT NULL,
    qd_level_value CHARACTER VARYING(33) NOT NULL,
    qd_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    qd_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    qd_cond_type CHARACTER VARYING(4) NOT NULL,
    qd_disc_percent NUMERIC(6,5) NOT NULL,
    qd_company_code CHARACTER VARYING(4) NOT NULL,
    qd_modified_by CHARACTER VARYING(12) NOT NULL,
    qd_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocprice.quantity_discount
     IS 'Quantity Discount Information';
COMMENT ON COLUMN ocprice.quantity_discount.qd_level_code
     IS 'Level code.';
COMMENT ON COLUMN ocprice.quantity_discount.qd_level_value
     IS 'Level value.';
COMMENT ON COLUMN ocprice.quantity_discount.qd_eff_date
     IS 'Effective date.';
COMMENT ON COLUMN ocprice.quantity_discount.qd_end_date
     IS 'End date.';
COMMENT ON COLUMN ocprice.quantity_discount.qd_cond_type
     IS 'Condition type.';
COMMENT ON COLUMN ocprice.quantity_discount.qd_disc_percent
     IS 'Discount percent.';
COMMENT ON COLUMN ocprice.quantity_discount.qd_company_code
     IS 'Company code.';
COMMENT ON COLUMN ocprice.quantity_discount.qd_modified_by
     IS 'Modified by.';
COMMENT ON COLUMN ocprice.quantity_discount.qd_mod_timestamp
     IS 'Modified timestamp.';

