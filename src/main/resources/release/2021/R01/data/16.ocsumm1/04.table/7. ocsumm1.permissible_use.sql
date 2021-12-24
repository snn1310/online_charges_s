CREATE TABLE ocsumm1.permissible_use(
    pu_id CHARACTER VARYING(33) NOT NULL,
    c_id CHARACTER VARYING(33) NOT NULL,
    pu_domain CHARACTER VARYING(15) NOT NULL,
    pu_company_id CHARACTER VARYING(4) NOT NULL,
    pu_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    pu_tran_type CHARACTER VARYING(18) NOT NULL,
    pu_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    pu_database_name CHARACTER VARYING(18) NOT NULL,
    pu_client_id_text CHARACTER VARYING(35) NOT NULL,
    pu_reason_codes CHARACTER VARYING(10),
    pu_query_text CHARACTER VARYING(4000),
    pu_doc_name CHARACTER VARYING(80),
    pu_encryption_key CHARACTER VARYING(32),
    pu_encrypted_document_name CHARACTER VARYING(192),
    pu_encrypted_doc_id CHARACTER VARYING(120),
    pu_long_encrypted_query_text TEXT
)
    PARTITION BY RANGE (pu_date)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocsumm1.permissible_use
     IS 'Permissible use.';
COMMENT ON COLUMN ocsumm1.permissible_use.pu_id
     IS 'Generated id';
COMMENT ON COLUMN ocsumm1.permissible_use.c_id
     IS 'Generated id to link to customer table';
COMMENT ON COLUMN ocsumm1.permissible_use.pu_domain
     IS 'Domain';
COMMENT ON COLUMN ocsumm1.permissible_use.pu_company_id
     IS 'Company id';
COMMENT ON COLUMN ocsumm1.permissible_use.pu_date
     IS 'Usage Date';
COMMENT ON COLUMN ocsumm1.permissible_use.pu_timestamp
     IS 'Timestamp';
COMMENT ON COLUMN ocsumm1.permissible_use.pu_database_name
     IS 'Database name';
COMMENT ON COLUMN ocsumm1.permissible_use.pu_client_id_text
     IS 'Client id text';
COMMENT ON COLUMN ocsumm1.permissible_use.pu_reason_codes
     IS 'Reason codes';
COMMENT ON COLUMN ocsumm1.permissible_use.pu_query_text
     IS 'Query text from search.';
COMMENT ON COLUMN ocsumm1.permissible_use.pu_doc_name
     IS 'Document name.';
COMMENT ON COLUMN ocsumm1.permissible_use.pu_encrypted_doc_id
     IS 'An encrypted doc id.';
COMMENT ON COLUMN ocsumm1.permissible_use.pu_long_encrypted_query_text
     IS 'Full encrypted query text';

