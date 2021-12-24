CREATE TABLE ocprice.document_price(
    pri_domain CHARACTER VARYING(15) NOT NULL,
    dp_prc_serv_type CHARACTER VARYING(3) NOT NULL,
    dp_billing_method CHARACTER(1) NOT NULL,
    dp_database_name CHARACTER VARYING(18) NOT NULL,
    dp_doc_id CHARACTER VARYING(33) NOT NULL,
    dp_usage_type CHARACTER VARYING(2) NOT NULL,
    dp_sub_usg_type CHARACTER VARYING(3) NOT NULL,
    pri_price_id CHARACTER VARYING(2) NOT NULL,
    dp_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    dp_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    dp_cls_mat_num CHARACTER VARYING(18) NOT NULL,
    dp_charge_rule CHARACTER(1) NOT NULL,
    dp_document_name CHARACTER VARYING(80) NOT NULL,
    dp_company_code CHARACTER VARYING(4) NOT NULL,
    dp_modified_by CHARACTER VARYING(12) NOT NULL,
    dp_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocprice.document_price
     IS 'Document Price Information';
COMMENT ON COLUMN ocprice.document_price.dp_prc_serv_type
     IS 'Pricing service type (Defaultable).';
COMMENT ON COLUMN ocprice.document_price.dp_billing_method
     IS 'Billing method.';
COMMENT ON COLUMN ocprice.document_price.dp_database_name
     IS 'Database name (Defaultable).';
COMMENT ON COLUMN ocprice.document_price.dp_doc_id
     IS 'Document id.';
COMMENT ON COLUMN ocprice.document_price.dp_usage_type
     IS 'Usage type.';
COMMENT ON COLUMN ocprice.document_price.dp_sub_usg_type
     IS 'Sub usage type (Defaultable).';
COMMENT ON COLUMN ocprice.document_price.pri_price_id
     IS 'Price id.';
COMMENT ON COLUMN ocprice.document_price.dp_eff_date
     IS 'Effective date.';
COMMENT ON COLUMN ocprice.document_price.dp_end_date
     IS 'End date.';
COMMENT ON COLUMN ocprice.document_price.dp_cls_mat_num
     IS 'Full document price class material number.';
COMMENT ON COLUMN ocprice.document_price.dp_charge_rule
     IS 'Usage charge rule.';
COMMENT ON COLUMN ocprice.document_price.dp_document_name
     IS 'Document name.';
COMMENT ON COLUMN ocprice.document_price.dp_modified_by
     IS 'Modified by.';
COMMENT ON COLUMN ocprice.document_price.dp_mod_timestamp
     IS 'Modified timestamp.';

