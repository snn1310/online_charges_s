CREATE OR REPLACE  VIEW ocsumm.vip_monitoring (vm_id, c_id, vm_domain, vm_company_id, vm_date, vm_timestamp, vm_tran_type, vm_onl_serv_type, vm_user_id, vm_session_id, vm_net_orig_addr, vm_database_name, vm_doc_name, vm_query_text, vm_encryption_key, vm_result_cnt, vm_ins_timestamp, vm_encrypted_document_name, vm_long_encrypted_query_text) AS
SELECT
    vm_id, c_id, vm_domain, vm_company_id, vm_date, vm_timestamp, vm_tran_type, vm_onl_serv_type, vm_user_id, vm_session_id, vm_net_orig_addr, vm_database_name, vm_doc_name, vm_query_text, vm_encryption_key, vm_result_cnt, vm_ins_timestamp, vm_encrypted_document_name, vm_long_encrypted_query_text
    FROM ocsumm1.vip_monitoring
UNION ALL
SELECT
    vm_id, c_id, vm_domain, vm_company_id, vm_date, vm_timestamp, vm_tran_type, vm_onl_serv_type, vm_user_id, vm_session_id, vm_net_orig_addr, vm_database_name, vm_doc_name, vm_query_text, vm_encryption_key, vm_result_cnt, vm_ins_timestamp, vm_encrypted_document_name, vm_long_encrypted_query_text
    FROM ocsumm2.vip_monitoring;

