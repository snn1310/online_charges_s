CREATE TABLE ocprice.currency_code(
    cc_company_code CHARACTER VARYING(4) NOT NULL,
    cc_currency_code CHARACTER VARYING(5) NOT NULL,
    cc_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    cc_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    cc_conversion_rate NUMERIC(12,5) NOT NULL,
    cc_decimal_places SMALLINT NOT NULL,
    cc_modified_by CHARACTER VARYING(12) NOT NULL,
    cc_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocprice.currency_code
     IS 'Currency Code Conversion Information';
COMMENT ON COLUMN ocprice.currency_code.cc_company_code
     IS 'Company code.';
COMMENT ON COLUMN ocprice.currency_code.cc_currency_code
     IS 'Currency code.';
COMMENT ON COLUMN ocprice.currency_code.cc_eff_date
     IS 'Effective date.';
COMMENT ON COLUMN ocprice.currency_code.cc_end_date
     IS 'End date';
COMMENT ON COLUMN ocprice.currency_code.cc_conversion_rate
     IS 'Currency conversion rate per USD.';
COMMENT ON COLUMN ocprice.currency_code.cc_decimal_places
     IS 'Decimal places.';
COMMENT ON COLUMN ocprice.currency_code.cc_modified_by
     IS 'Modified by.';
COMMENT ON COLUMN ocprice.currency_code.cc_mod_timestamp
     IS 'Modified timestamp.';

