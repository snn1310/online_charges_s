CREATE TABLE ocdetail.royalty_tran_usage(
    rtu_id CHARACTER VARYING(33) NOT NULL,
    sgd_id CHARACTER VARYING(33) NOT NULL,
    rtu_session_start_date TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    rtu_tran_type CHARACTER VARYING(18) NOT NULL,
    rtu_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    rtu_access_method CHARACTER VARYING(3),
    rtu_repeat_code CHARACTER(1) NOT NULL,
    rtu_trail_code CHARACTER(1) NOT NULL,
    rtu_request_source CHARACTER VARYING(4),
    rtu_request_ver CHARACTER VARYING(4),
    rtu_database_name CHARACTER VARYING(18) NOT NULL,
    rtu_format_code CHARACTER VARYING(3) NOT NULL,
    rtu_doc_id CHARACTER VARYING(33),
    rtu_doc_name CHARACTER VARYING(80),
    rtu_reason_codes CHARACTER VARYING(10),
    rtu_tran_cnt INTEGER NOT NULL,
    rtu_rank INTEGER
)
    PARTITION BY RANGE (rtu_session_start_date)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocdetail.royalty_tran_usage
     IS 'Royalty Transaction Usage';
COMMENT ON COLUMN ocdetail.royalty_tran_usage.rtu_id
     IS 'Generated id.';
COMMENT ON COLUMN ocdetail.royalty_tran_usage.sgd_id
     IS 'Generated id from segment_detail.';
COMMENT ON COLUMN ocdetail.royalty_tran_usage.rtu_session_start_date
     IS 'Session start date, used for partitions.';
COMMENT ON COLUMN ocdetail.royalty_tran_usage.rtu_tran_type
     IS 'Transaction type.';
COMMENT ON COLUMN ocdetail.royalty_tran_usage.rtu_timestamp
     IS 'Timestamp.';
COMMENT ON COLUMN ocdetail.royalty_tran_usage.rtu_access_method
     IS 'Access method';
COMMENT ON COLUMN ocdetail.royalty_tran_usage.rtu_repeat_code
     IS 'Repeat code.';
COMMENT ON COLUMN ocdetail.royalty_tran_usage.rtu_trail_code
     IS 'Revisited indicator.';
COMMENT ON COLUMN ocdetail.royalty_tran_usage.rtu_request_source
     IS 'Request source.';
COMMENT ON COLUMN ocdetail.royalty_tran_usage.rtu_request_ver
     IS 'Request source version.';
COMMENT ON COLUMN ocdetail.royalty_tran_usage.rtu_database_name
     IS 'Database name.';
COMMENT ON COLUMN ocdetail.royalty_tran_usage.rtu_format_code
     IS 'Format code (sub usage type).';
COMMENT ON COLUMN ocdetail.royalty_tran_usage.rtu_doc_id
     IS 'Document id.';
COMMENT ON COLUMN ocdetail.royalty_tran_usage.rtu_doc_name
     IS 'Document name.';
COMMENT ON COLUMN ocdetail.royalty_tran_usage.rtu_reason_codes
     IS 'Reason codes.';
COMMENT ON COLUMN ocdetail.royalty_tran_usage.rtu_tran_cnt
     IS 'Search transaction count.';
COMMENT ON COLUMN ocdetail.royalty_tran_usage.rtu_rank
     IS 'Rank';

