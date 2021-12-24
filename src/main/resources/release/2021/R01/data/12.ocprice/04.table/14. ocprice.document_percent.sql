CREATE TABLE ocprice.document_percent(
    pri_domain CHARACTER VARYING(15) NOT NULL,
    dpt_prc_serv_type CHARACTER VARYING(3) NOT NULL,
    dpt_billing_method CHARACTER(1) NOT NULL,
    dpt_database_name CHARACTER VARYING(18) NOT NULL,
    dpt_usage_type CHARACTER VARYING(2) NOT NULL,
    dpt_sub_usg_type CHARACTER VARYING(3) NOT NULL,
    pri_price_id CHARACTER VARYING(2) NOT NULL,
    dpt_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    dpt_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    dpt_percent NUMERIC(7,5) NOT NULL,
    dpt_company_code CHARACTER VARYING(4) NOT NULL,
    dpt_modified_by CHARACTER VARYING(12) NOT NULL,
    dpt_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocprice.document_percent
     IS 'Document Percent Information';
COMMENT ON COLUMN ocprice.document_percent.dpt_prc_serv_type
     IS 'Pricing service type (Defaultable).';
COMMENT ON COLUMN ocprice.document_percent.dpt_billing_method
     IS 'Billing method.';
COMMENT ON COLUMN ocprice.document_percent.dpt_database_name
     IS 'Database name (Defaultable).';
COMMENT ON COLUMN ocprice.document_percent.dpt_usage_type
     IS 'Usage type.';
COMMENT ON COLUMN ocprice.document_percent.dpt_sub_usg_type
     IS 'Sub usage type (Defaultable).';
COMMENT ON COLUMN ocprice.document_percent.pri_price_id
     IS 'Price id.';
COMMENT ON COLUMN ocprice.document_percent.dpt_eff_date
     IS 'Effective date.';
COMMENT ON COLUMN ocprice.document_percent.dpt_end_date
     IS 'End date.';
COMMENT ON COLUMN ocprice.document_percent.dpt_percent
     IS 'Percent.';
COMMENT ON COLUMN ocprice.document_percent.dpt_modified_by
     IS 'Modified by.';
COMMENT ON COLUMN ocprice.document_percent.dpt_mod_timestamp
     IS 'Modified timestamp.';

