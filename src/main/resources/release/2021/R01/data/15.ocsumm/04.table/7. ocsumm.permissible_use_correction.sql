CREATE TABLE ocsumm.permissible_use_correction(
    puc_id CHARACTER VARYING(33) NOT NULL,
    c_id CHARACTER VARYING(33) NOT NULL,
    puc_domain CHARACTER VARYING(15) NOT NULL,
    puc_company_id CHARACTER VARYING(4) NOT NULL,
    puc_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    puc_tran_type CHARACTER VARYING(18) NOT NULL,
    puc_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    puc_database_name CHARACTER VARYING(18) NOT NULL,
    puc_client_id_text CHARACTER VARYING(35) NOT NULL,
    puc_reason_codes CHARACTER VARYING(10),
    puc_query_text CHARACTER VARYING(4000),
    puc_doc_name CHARACTER VARYING(80),
    puc_encryption_key CHARACTER VARYING(32),
    puc_encrypted_document_name CHARACTER VARYING(192),
    puc_encrypted_doc_id CHARACTER VARYING(120),
    puc_long_encrypted_query_text TEXT
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocsumm.permissible_use_correction
     IS 'Permissible use.';
COMMENT ON COLUMN ocsumm.permissible_use_correction.puc_id
     IS 'Generated id';
COMMENT ON COLUMN ocsumm.permissible_use_correction.c_id
     IS 'Generated id to link to customer table';
COMMENT ON COLUMN ocsumm.permissible_use_correction.puc_domain
     IS 'Domain';
COMMENT ON COLUMN ocsumm.permissible_use_correction.puc_company_id
     IS 'Company id';
COMMENT ON COLUMN ocsumm.permissible_use_correction.puc_date
     IS 'Usage Date';
COMMENT ON COLUMN ocsumm.permissible_use_correction.puc_timestamp
     IS 'Timestamp';
COMMENT ON COLUMN ocsumm.permissible_use_correction.puc_database_name
     IS 'Database name';
COMMENT ON COLUMN ocsumm.permissible_use_correction.puc_client_id_text
     IS 'Client id text';
COMMENT ON COLUMN ocsumm.permissible_use_correction.puc_reason_codes
     IS 'Reason codes';
COMMENT ON COLUMN ocsumm.permissible_use_correction.puc_query_text
     IS 'Query text from search.';
COMMENT ON COLUMN ocsumm.permissible_use_correction.puc_doc_name
     IS 'Document name.';
COMMENT ON COLUMN ocsumm.permissible_use_correction.puc_encrypted_doc_id
     IS 'An encrypted doc id.';
COMMENT ON COLUMN ocsumm.permissible_use_correction.puc_long_encrypted_query_text
     IS 'Full encrypted query text';

