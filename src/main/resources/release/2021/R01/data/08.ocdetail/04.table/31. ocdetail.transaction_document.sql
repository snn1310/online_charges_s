CREATE TABLE ocdetail.transaction_document(
    td_id CHARACTER VARYING(33) NOT NULL,
    td_session_start_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    tu_id CHARACTER VARYING(33) NOT NULL,
    td_doc_id CHARACTER VARYING(33),
    td_encryption_key CHARACTER VARYING(32),
    td_encrypted_doc_id CHARACTER VARYING(120)
)
    PARTITION BY RANGE (td_session_start_date)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN ocdetail.transaction_document.td_id
     IS 'Generated ID';
COMMENT ON COLUMN ocdetail.transaction_document.td_session_start_date
     IS 'Session Start Date';
COMMENT ON COLUMN ocdetail.transaction_document.tu_id
     IS 'Transaction Id';
COMMENT ON COLUMN ocdetail.transaction_document.td_doc_id
     IS 'Document Id';
COMMENT ON COLUMN ocdetail.transaction_document.td_encryption_key
     IS 'Encryption key';
COMMENT ON COLUMN ocdetail.transaction_document.td_encrypted_doc_id
     IS 'Encrypted document Id';

