CREATE TABLE ocsumm2.customer_document_map(
    cdm_id CHARACTER VARYING(33) NOT NULL,
    cdm_bill_grp CHARACTER VARYING(10) NOT NULL,
    cdm_usage_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    cdm_domain CHARACTER VARYING(15) NOT NULL,
    cdm_acct_criterion CHARACTER VARYING(4) NOT NULL,
    cdm_doc_id CHARACTER VARYING(33),
    cdm_encryption_key CHARACTER VARYING(32),
    cdm_encrypted_doc_id CHARACTER VARYING(120),
    cdm_tran_type CHARACTER VARYING(18) NOT NULL,
    cdm_database_name CHARACTER VARYING(18) NOT NULL,
    cdm_tran_count BIGINT NOT NULL,
    cdm_company_id CHARACTER VARYING(4)
)
    PARTITION BY RANGE (cdm_usage_date)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN ocsumm2.customer_document_map.cdm_id
     IS 'Generated Id';
COMMENT ON COLUMN ocsumm2.customer_document_map.cdm_bill_grp
     IS 'Billing group number';
COMMENT ON COLUMN ocsumm2.customer_document_map.cdm_usage_date
     IS 'Usage Date';
COMMENT ON COLUMN ocsumm2.customer_document_map.cdm_domain
     IS 'Prism domain';
COMMENT ON COLUMN ocsumm2.customer_document_map.cdm_acct_criterion
     IS 'Account data to map to the customer type (industry code)';
COMMENT ON COLUMN ocsumm2.customer_document_map.cdm_doc_id
     IS 'Document Id';
COMMENT ON COLUMN ocsumm2.customer_document_map.cdm_encryption_key
     IS 'Encryption key for encrypted documents';
COMMENT ON COLUMN ocsumm2.customer_document_map.cdm_encrypted_doc_id
     IS 'Encrypted document Id';
COMMENT ON COLUMN ocsumm2.customer_document_map.cdm_tran_type
     IS 'Transaction type';
COMMENT ON COLUMN ocsumm2.customer_document_map.cdm_database_name
     IS 'Content database name';
COMMENT ON COLUMN ocsumm2.customer_document_map.cdm_tran_count
     IS 'Transaction count';
COMMENT ON COLUMN ocsumm2.customer_document_map.cdm_company_id
     IS 'Company Id (sales org)';

