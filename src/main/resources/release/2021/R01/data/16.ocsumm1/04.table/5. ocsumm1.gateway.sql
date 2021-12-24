CREATE TABLE ocsumm1.gateway(
    g_id CHARACTER VARYING(33) NOT NULL,
    c_id CHARACTER VARYING(33) NOT NULL,
    g_domain CHARACTER VARYING(15) NOT NULL,
    g_company_id CHARACTER VARYING(4) NOT NULL,
    g_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    g_database_name CHARACTER VARYING(18) NOT NULL,
    g_gateway_type CHARACTER VARYING(3) NOT NULL,
    g_pool_code CHARACTER(1) NOT NULL,
    g_doc_req_cnt INTEGER NOT NULL,
    g_doc_view_cnt SMALLINT NOT NULL,
    g_cite_req_cnt INTEGER NOT NULL,
    g_cite_view_cnt SMALLINT NOT NULL,
    g_image_req_cnt SMALLINT NOT NULL,
    g_locate_doc_cnt SMALLINT NOT NULL
)
    PARTITION BY RANGE (g_date)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocsumm1.gateway
     IS 'Gateway';
COMMENT ON COLUMN ocsumm1.gateway.g_id
     IS 'Generated id';
COMMENT ON COLUMN ocsumm1.gateway.c_id
     IS 'Generated id to link to customer table.';
COMMENT ON COLUMN ocsumm1.gateway.g_domain
     IS 'Domain';
COMMENT ON COLUMN ocsumm1.gateway.g_company_id
     IS 'Company id';
COMMENT ON COLUMN ocsumm1.gateway.g_date
     IS 'Usage date';
COMMENT ON COLUMN ocsumm1.gateway.g_database_name
     IS 'Database name';
COMMENT ON COLUMN ocsumm1.gateway.g_gateway_type
     IS 'Gateway type';
COMMENT ON COLUMN ocsumm1.gateway.g_pool_code
     IS 'Pool code';
COMMENT ON COLUMN ocsumm1.gateway.g_doc_req_cnt
     IS 'Document request count';
COMMENT ON COLUMN ocsumm1.gateway.g_doc_view_cnt
     IS 'Document view count';
COMMENT ON COLUMN ocsumm1.gateway.g_cite_req_cnt
     IS 'Cite request count';
COMMENT ON COLUMN ocsumm1.gateway.g_cite_view_cnt
     IS 'Cite view count';
COMMENT ON COLUMN ocsumm1.gateway.g_image_req_cnt
     IS 'Image request count';
COMMENT ON COLUMN ocsumm1.gateway.g_locate_doc_cnt
     IS 'Locate document count';

