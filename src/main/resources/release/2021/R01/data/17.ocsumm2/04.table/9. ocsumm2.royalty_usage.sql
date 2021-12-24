CREATE TABLE ocsumm2.royalty_usage(
    ru_id CHARACTER VARYING(33) NOT NULL,
    c_id CHARACTER VARYING(33) NOT NULL,
    ru_domain CHARACTER VARYING(15) NOT NULL,
    ru_company_id CHARACTER VARYING(4) NOT NULL,
    ru_date TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    ru_usage_type CHARACTER VARYING(2) NOT NULL,
    ru_unit_cnt BIGINT NOT NULL,
    ru_access_method CHARACTER VARYING(3),
    ru_repeat_code CHARACTER(1) NOT NULL,
    ru_trail_code CHARACTER(1) NOT NULL,
    ru_request_source CHARACTER VARYING(4),
    ru_request_ver CHARACTER VARYING(4),
    ru_database_name CHARACTER VARYING(18) NOT NULL,
    ru_format_code CHARACTER VARYING(3) NOT NULL,
    ru_doc_id CHARACTER VARYING(33),
    ru_doc_name CHARACTER VARYING(80),
    ru_royalty_id CHARACTER VARYING(18) NOT NULL,
    ru_doc_cnt BIGINT NOT NULL,
    ru_from_usage_id CHARACTER VARYING(33),
    ru_db_mat_num CHARACTER VARYING(18) NOT NULL,
    ru_vendor_code CHARACTER VARYING(3) NOT NULL
)
    PARTITION BY RANGE (ru_date)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocsumm2.royalty_usage
     IS 'Royalty Usage';
COMMENT ON COLUMN ocsumm2.royalty_usage.ru_id
     IS 'Generated id.';
COMMENT ON COLUMN ocsumm2.royalty_usage.c_id
     IS 'Generated id to link to customer table.';
COMMENT ON COLUMN ocsumm2.royalty_usage.ru_domain
     IS 'Domain.';
COMMENT ON COLUMN ocsumm2.royalty_usage.ru_company_id
     IS 'Company id.';
COMMENT ON COLUMN ocsumm2.royalty_usage.ru_date
     IS 'Usage date.';
COMMENT ON COLUMN ocsumm2.royalty_usage.ru_usage_type
     IS 'Usage type.';
COMMENT ON COLUMN ocsumm2.royalty_usage.ru_unit_cnt
     IS 'Unit count.';
COMMENT ON COLUMN ocsumm2.royalty_usage.ru_access_method
     IS 'Access method';
COMMENT ON COLUMN ocsumm2.royalty_usage.ru_repeat_code
     IS 'Repeat code.';
COMMENT ON COLUMN ocsumm2.royalty_usage.ru_trail_code
     IS 'Revisited indicator.';
COMMENT ON COLUMN ocsumm2.royalty_usage.ru_request_source
     IS 'Request source.';
COMMENT ON COLUMN ocsumm2.royalty_usage.ru_request_ver
     IS 'Request source version.';
COMMENT ON COLUMN ocsumm2.royalty_usage.ru_database_name
     IS 'Database name.';
COMMENT ON COLUMN ocsumm2.royalty_usage.ru_format_code
     IS 'Format code (sub usage type).';
COMMENT ON COLUMN ocsumm2.royalty_usage.ru_doc_id
     IS 'Document id.';
COMMENT ON COLUMN ocsumm2.royalty_usage.ru_doc_name
     IS 'Document name.';
COMMENT ON COLUMN ocsumm2.royalty_usage.ru_royalty_id
     IS 'Royalty id.';
COMMENT ON COLUMN ocsumm2.royalty_usage.ru_doc_cnt
     IS 'Print reporting document count.';
COMMENT ON COLUMN ocsumm2.royalty_usage.ru_from_usage_id
     IS 'From usage id.';
COMMENT ON COLUMN ocsumm2.royalty_usage.ru_db_mat_num
     IS 'Database material number.';
COMMENT ON COLUMN ocsumm2.royalty_usage.ru_vendor_code
     IS 'Database vendor code.';

