CREATE OR REPLACE  VIEW ocsumm.permissible_use (pu_id, c_id, pu_domain, pu_company_id, pu_date, pu_tran_type, pu_timestamp, pu_database_name, pu_client_id_text, pu_reason_codes, pu_query_text, pu_doc_name, pu_encryption_key, pu_encrypted_document_name, pu_encrypted_doc_id, pu_long_encrypted_query_text) AS
SELECT
    pu_id, c_id, pu_domain, pu_company_id, pu_date, pu_tran_type, pu_timestamp, pu_database_name, pu_client_id_text, pu_reason_codes, pu_query_text, pu_doc_name, pu_encryption_key, pu_encrypted_document_name, pu_encrypted_doc_id, pu_long_encrypted_query_text
    FROM ocsumm1.permissible_use
UNION ALL
SELECT
    pu_id, c_id, pu_domain, pu_company_id, pu_date, pu_tran_type, pu_timestamp, pu_database_name, pu_client_id_text, pu_reason_codes, pu_query_text, pu_doc_name, pu_encryption_key, pu_encrypted_document_name, pu_encrypted_doc_id, pu_long_encrypted_query_text
    FROM ocsumm2.permissible_use;

