CREATE TABLE ccdetail2.gateway_royalty(
    gr_id CHARACTER VARYING(33) NOT NULL,
    sgd_id CHARACTER VARYING(33) NOT NULL,
    gr_session_start_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    gr_gateway_type CHARACTER VARYING(3) NOT NULL,
    gr_database_name CHARACTER VARYING(18) NOT NULL,
    gr_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    gr_pool_code CHARACTER(1) NOT NULL,
    gr_doc_req_cnt INTEGER NOT NULL,
    gr_doc_view_cnt SMALLINT NOT NULL,
    gr_cite_req_cnt SMALLINT NOT NULL,
    gr_cite_view_cnt SMALLINT NOT NULL,
    gr_image_req_cnt SMALLINT NOT NULL,
    gr_locate_doc_cnt SMALLINT NOT NULL
)
    PARTITION BY RANGE (gr_session_start_date)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ccdetail2.gateway_royalty
     IS 'Gateway Royalty';
COMMENT ON COLUMN ccdetail2.gateway_royalty.gr_id
     IS 'Generated id.';
COMMENT ON COLUMN ccdetail2.gateway_royalty.sgd_id
     IS 'Generated id.';
COMMENT ON COLUMN ccdetail2.gateway_royalty.gr_session_start_date
     IS 'Session start date, used for partitioning.';
COMMENT ON COLUMN ccdetail2.gateway_royalty.gr_gateway_type
     IS 'Gateway type.';
COMMENT ON COLUMN ccdetail2.gateway_royalty.gr_database_name
     IS 'Database name.';
COMMENT ON COLUMN ccdetail2.gateway_royalty.gr_timestamp
     IS 'Timestamp';
COMMENT ON COLUMN ccdetail2.gateway_royalty.gr_pool_code
     IS 'Pool code';
COMMENT ON COLUMN ccdetail2.gateway_royalty.gr_doc_req_cnt
     IS 'Document request count';
COMMENT ON COLUMN ccdetail2.gateway_royalty.gr_doc_view_cnt
     IS 'Document view count';
COMMENT ON COLUMN ccdetail2.gateway_royalty.gr_cite_req_cnt
     IS 'Cite request count';
COMMENT ON COLUMN ccdetail2.gateway_royalty.gr_cite_view_cnt
     IS 'Cite view count';
COMMENT ON COLUMN ccdetail2.gateway_royalty.gr_image_req_cnt
     IS 'Image request count.';
COMMENT ON COLUMN ccdetail2.gateway_royalty.gr_locate_doc_cnt
     IS 'Locate document count.';

