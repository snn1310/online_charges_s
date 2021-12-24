CREATE TABLE ocprice.onl_service_price(
    osp_domain CHARACTER VARYING(15) NOT NULL,
    osp_onl_serv_type CHARACTER VARYING(4) NOT NULL,
    osp_billing_method CHARACTER(1) NOT NULL,
    osp_database_name CHARACTER VARYING(18) NOT NULL,
    osp_usage_type CHARACTER VARYING(2) NOT NULL,
    osp_access_method CHARACTER VARYING(3) NOT NULL DEFAULT 'DFT',
    osp_sub_usg_type CHARACTER VARYING(18) NOT NULL,
    osp_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    osp_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    osp_charge_rule CHARACTER(1) NOT NULL,
    osp_score SMALLINT,
    osp_company_code CHARACTER VARYING(4) NOT NULL,
    osp_modified_by CHARACTER VARYING(12) NOT NULL,
    osp_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocprice.onl_service_price
     IS 'Online Service Price Information';
COMMENT ON COLUMN ocprice.onl_service_price.osp_onl_serv_type
     IS 'Online service type.';
COMMENT ON COLUMN ocprice.onl_service_price.osp_billing_method
     IS 'Billing method.';
COMMENT ON COLUMN ocprice.onl_service_price.osp_database_name
     IS 'Database name (Defaultable).';
COMMENT ON COLUMN ocprice.onl_service_price.osp_usage_type
     IS 'Usage type.';
COMMENT ON COLUMN ocprice.onl_service_price.osp_access_method
     IS 'The access method that applies to this online service price.';
COMMENT ON COLUMN ocprice.onl_service_price.osp_sub_usg_type
     IS 'Sub usage type (Defaultable).';
COMMENT ON COLUMN ocprice.onl_service_price.osp_eff_date
     IS 'Effective date.';
COMMENT ON COLUMN ocprice.onl_service_price.osp_end_date
     IS 'End date.';
COMMENT ON COLUMN ocprice.onl_service_price.osp_charge_rule
     IS 'Usage charge rule.';
COMMENT ON COLUMN ocprice.onl_service_price.osp_score
     IS 'Rank the records for usage application.';
COMMENT ON COLUMN ocprice.onl_service_price.osp_company_code
     IS 'Company code.';
COMMENT ON COLUMN ocprice.onl_service_price.osp_modified_by
     IS 'Modified by.';
COMMENT ON COLUMN ocprice.onl_service_price.osp_mod_timestamp
     IS 'Modified timestamp.';

