CREATE TABLE ocsumm2.vip_monitoring(
    vm_id CHARACTER VARYING(33) NOT NULL,
    c_id CHARACTER VARYING(33) NOT NULL,
    vm_domain CHARACTER VARYING(15) NOT NULL,
    vm_company_id CHARACTER VARYING(4) NOT NULL,
    vm_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    vm_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    vm_tran_type CHARACTER VARYING(18) NOT NULL DEFAULT 'SEARCH',
    vm_onl_serv_type CHARACTER VARYING(4) NOT NULL,
    vm_user_id CHARACTER VARYING(33) NOT NULL,
    vm_session_id CHARACTER VARYING(33) NOT NULL,
    vm_net_orig_addr CHARACTER VARYING(14),
    vm_database_name CHARACTER VARYING(18) NOT NULL,
    vm_doc_name CHARACTER VARYING(80),
    vm_query_text CHARACTER VARYING(4000),
    vm_encryption_key CHARACTER VARYING(32),
    vm_result_cnt INTEGER NOT NULL,
    vm_ins_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    vm_encrypted_document_name CHARACTER VARYING(192),
    vm_long_encrypted_query_text TEXT
)
    PARTITION BY RANGE (vm_date)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocsumm2.vip_monitoring
     IS 'VIP Monitoring';
COMMENT ON COLUMN ocsumm2.vip_monitoring.vm_id
     IS 'Generated id';
COMMENT ON COLUMN ocsumm2.vip_monitoring.c_id
     IS 'Generated id to link to customer table';
COMMENT ON COLUMN ocsumm2.vip_monitoring.vm_domain
     IS 'Domain';
COMMENT ON COLUMN ocsumm2.vip_monitoring.vm_date
     IS 'Usage Date';
COMMENT ON COLUMN ocsumm2.vip_monitoring.vm_timestamp
     IS 'Timestamp';
COMMENT ON COLUMN ocsumm2.vip_monitoring.vm_database_name
     IS 'Database name';
COMMENT ON COLUMN ocsumm2.vip_monitoring.vm_query_text
     IS 'Query text from search.';
COMMENT ON COLUMN ocsumm2.vip_monitoring.vm_long_encrypted_query_text
     IS 'Full encrypted query text';

