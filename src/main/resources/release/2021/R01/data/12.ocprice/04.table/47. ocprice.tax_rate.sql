CREATE TABLE ocprice.tax_rate(
    tr_country_code CHARACTER VARYING(3) NOT NULL,
    tr_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    tr_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    tr_rate NUMERIC(5,4) NOT NULL,
    tr_modified_by CHARACTER VARYING(12) NOT NULL,
    tr_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN ocprice.tax_rate.tr_country_code
     IS 'Country code.';
COMMENT ON COLUMN ocprice.tax_rate.tr_eff_date
     IS 'Effective date.';
COMMENT ON COLUMN ocprice.tax_rate.tr_end_date
     IS 'End date.';
COMMENT ON COLUMN ocprice.tax_rate.tr_rate
     IS 'Tax rate percent.';
COMMENT ON COLUMN ocprice.tax_rate.tr_modified_by
     IS 'Modified by.';
COMMENT ON COLUMN ocprice.tax_rate.tr_mod_timestamp
     IS 'Modified timestamp.';

