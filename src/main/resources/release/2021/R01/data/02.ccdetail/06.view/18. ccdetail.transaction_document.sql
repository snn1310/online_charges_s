CREATE OR REPLACE  VIEW ccdetail.transaction_document (td_id, td_session_start_date, tu_id, td_doc_id, td_encryption_key, td_encrypted_doc_id) AS
SELECT
    td_id, td_session_start_date, tu_id, td_doc_id, td_encryption_key, td_encrypted_doc_id
    FROM ccdetail1.transaction_document
UNION ALL
SELECT
    td_id, td_session_start_date, tu_id, td_doc_id, td_encryption_key, td_encrypted_doc_id
    FROM ccdetail2.transaction_document
UNION ALL
SELECT
    td_id, td_session_start_date, tu_id, td_doc_id, td_encryption_key, td_encrypted_doc_id
    FROM ccdetail3.transaction_document
UNION ALL
SELECT
    td_id, td_session_start_date, tu_id, td_doc_id, td_encryption_key, td_encrypted_doc_id
    FROM ccdetail4.transaction_document;

