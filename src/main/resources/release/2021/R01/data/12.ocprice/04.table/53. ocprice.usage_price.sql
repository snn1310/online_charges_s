CREATE TABLE ocprice.usage_price(
    pri_domain CHARACTER VARYING(15) NOT NULL,
    up_prc_serv_type CHARACTER VARYING(3) NOT NULL,
    up_billing_method CHARACTER(1) NOT NULL,
    up_database_name CHARACTER VARYING(18) NOT NULL,
    up_usage_type CHARACTER VARYING(2) NOT NULL,
    up_access_method CHARACTER VARYING(3) NOT NULL DEFAULT 'DFT',
    up_sub_usg_type CHARACTER VARYING(18) NOT NULL,
    pri_price_id CHARACTER VARYING(2) NOT NULL,
    up_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    up_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    up_cls_mat_num CHARACTER VARYING(18) NOT NULL,
    up_charge_rule CHARACTER(1) NOT NULL,
    up_score SMALLINT NOT NULL,
    up_company_code CHARACTER VARYING(4) NOT NULL,
    up_modified_by CHARACTER VARYING(12) NOT NULL,
    up_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocprice.usage_price
     IS 'Usage Price Information';
COMMENT ON COLUMN ocprice.usage_price.up_prc_serv_type
     IS 'Pricing service type (Defaultable).';
COMMENT ON COLUMN ocprice.usage_price.up_billing_method
     IS 'Billing method.';
COMMENT ON COLUMN ocprice.usage_price.up_database_name
     IS 'Database name (Defaultable).';
COMMENT ON COLUMN ocprice.usage_price.up_usage_type
     IS 'Usage type.';
COMMENT ON COLUMN ocprice.usage_price.up_access_method
     IS 'The access method that applies to this usage price.';
COMMENT ON COLUMN ocprice.usage_price.up_sub_usg_type
     IS 'Sub usage type (Defaultable).';
COMMENT ON COLUMN ocprice.usage_price.pri_price_id
     IS 'Price id.';
COMMENT ON COLUMN ocprice.usage_price.up_eff_date
     IS 'Effective date.';
COMMENT ON COLUMN ocprice.usage_price.up_end_date
     IS 'End date.';
COMMENT ON COLUMN ocprice.usage_price.up_cls_mat_num
     IS 'Price class material number.';
COMMENT ON COLUMN ocprice.usage_price.up_charge_rule
     IS 'Usage charge rule.';
COMMENT ON COLUMN ocprice.usage_price.up_score
     IS 'Rank the records for price application.';
COMMENT ON COLUMN ocprice.usage_price.up_modified_by
     IS 'Modified by.';
COMMENT ON COLUMN ocprice.usage_price.up_mod_timestamp
     IS 'Modified timestamp.';

