CREATE TABLE ccdetail1.warn(
    w_id CHARACTER VARYING(33) NOT NULL,
    sgd_id CHARACTER VARYING(33) NOT NULL,
    w_session_start_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    w_warn_type CHARACTER VARYING(3) NOT NULL,
    w_database_name CHARACTER VARYING(18) NOT NULL,
    w_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    w_document_name CHARACTER VARYING(80),
    w_meter_code CHARACTER(1) NOT NULL,
    w_access_method CHARACTER VARYING(3),
    w_encrypted_document_name CHARACTER VARYING(192),
    w_encryption_key CHARACTER VARYING(32),
    w_note CHARACTER VARYING(50)
)
    PARTITION BY RANGE (w_session_start_date)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ccdetail1.warn
     IS 'Warn';
COMMENT ON COLUMN ccdetail1.warn.w_id
     IS 'Generated id.';
COMMENT ON COLUMN ccdetail1.warn.sgd_id
     IS 'Generated id.';
COMMENT ON COLUMN ccdetail1.warn.w_session_start_date
     IS 'Session start date, used for partitioning.';
COMMENT ON COLUMN ccdetail1.warn.w_warn_type
     IS 'Warn type.';
COMMENT ON COLUMN ccdetail1.warn.w_database_name
     IS 'Database name.';
COMMENT ON COLUMN ccdetail1.warn.w_timestamp
     IS 'Timestamp.';
COMMENT ON COLUMN ccdetail1.warn.w_document_name
     IS 'Document name.';
COMMENT ON COLUMN ccdetail1.warn.w_meter_code
     IS 'Meter code.';
COMMENT ON COLUMN ccdetail1.warn.w_access_method
     IS 'Access method.';

