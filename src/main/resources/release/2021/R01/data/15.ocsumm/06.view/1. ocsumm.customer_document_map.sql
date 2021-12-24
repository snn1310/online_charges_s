CREATE OR REPLACE  VIEW ocsumm.customer_document_map (cdm_id, cdm_bill_grp, cdm_usage_date, cdm_domain, cdm_acct_criterion, cdm_doc_id, cdm_encryption_key, cdm_encrypted_doc_id, cdm_tran_type, cdm_database_name, cdm_tran_count, cdm_company_id) AS
SELECT
    cdm_id, cdm_bill_grp, cdm_usage_date, cdm_domain, cdm_acct_criterion, cdm_doc_id, cdm_encryption_key, cdm_encrypted_doc_id, cdm_tran_type, cdm_database_name, cdm_tran_count, cdm_company_id
    FROM ocsumm1.customer_document_map
UNION ALL
SELECT
    cdm_id, cdm_bill_grp, cdm_usage_date, cdm_domain, cdm_acct_criterion, cdm_doc_id, cdm_encryption_key, cdm_encrypted_doc_id, cdm_tran_type, cdm_database_name, cdm_tran_count, cdm_company_id
    FROM ocsumm2.customer_document_map;

