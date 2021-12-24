CREATE TABLE ocprice.override_billing_option(
    obo_domain CHARACTER VARYING(15) NOT NULL,
    obo_pricing_service_type CHARACTER VARYING(3) NOT NULL,
    obo_billing_method CHARACTER VARYING(1) NOT NULL,
    obo_database_name CHARACTER VARYING(18) NOT NULL,
    obo_usage_type CHARACTER VARYING(2) NOT NULL,
    obo_access_method CHARACTER VARYING(3) NOT NULL DEFAULT 'DFT',
    obo_sub_usage_type CHARACTER VARYING(18) NOT NULL,
    obo_price_id CHARACTER VARYING(2) NOT NULL,
    obo_effective_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    obo_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    obo_score SMALLINT NOT NULL,
    obo_override_billing_method CHARACTER VARYING(1) NOT NULL,
    obo_company_code CHARACTER VARYING(4) NOT NULL,
    obo_modified_by CHARACTER VARYING(12) NOT NULL,
    obo_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN ocprice.override_billing_option.obo_domain
     IS 'The domain the override applies to.';
COMMENT ON COLUMN ocprice.override_billing_option.obo_pricing_service_type
     IS 'The pricing service type that matches the override.';
COMMENT ON COLUMN ocprice.override_billing_option.obo_billing_method
     IS 'The billing method that matches the override.';
COMMENT ON COLUMN ocprice.override_billing_option.obo_database_name
     IS 'The database name that matches the override.';
COMMENT ON COLUMN ocprice.override_billing_option.obo_usage_type
     IS 'The usage type that matches the override.';
COMMENT ON COLUMN ocprice.override_billing_option.obo_access_method
     IS 'The access method that applies to this override billing option.';
COMMENT ON COLUMN ocprice.override_billing_option.obo_sub_usage_type
     IS 'The sub usage type that matches the override.';
COMMENT ON COLUMN ocprice.override_billing_option.obo_price_id
     IS 'The Price ID that matches the override.';
COMMENT ON COLUMN ocprice.override_billing_option.obo_effective_date
     IS 'The date the override is effective.';
COMMENT ON COLUMN ocprice.override_billing_option.obo_end_date
     IS 'The date the override ends.';
COMMENT ON COLUMN ocprice.override_billing_option.obo_score
     IS 'Ordering rule for the override.';
COMMENT ON COLUMN ocprice.override_billing_option.obo_override_billing_method
     IS 'The override value.';
COMMENT ON COLUMN ocprice.override_billing_option.obo_company_code
     IS 'The company code of the user that applied the override.';
COMMENT ON COLUMN ocprice.override_billing_option.obo_modified_by
     IS 'The user that applied the override.';
COMMENT ON COLUMN ocprice.override_billing_option.obo_mod_timestamp
     IS 'The time the override was entered.';

