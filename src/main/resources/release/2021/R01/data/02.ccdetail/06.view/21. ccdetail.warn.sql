CREATE OR REPLACE  VIEW ccdetail.warn (w_id, sgd_id, w_session_start_date, w_warn_type, w_database_name, w_timestamp, w_document_name, w_meter_code, w_access_method, w_encrypted_document_name, w_encryption_key, w_note) AS
SELECT
    w_id, sgd_id, w_session_start_date, w_warn_type, w_database_name, w_timestamp, w_document_name, w_meter_code, w_access_method, w_encrypted_document_name, w_encryption_key, w_note
    FROM ccdetail1.warn
UNION ALL
SELECT
    w_id, sgd_id, w_session_start_date, w_warn_type, w_database_name, w_timestamp, w_document_name, w_meter_code, w_access_method, w_encrypted_document_name, w_encryption_key, w_note
    FROM ccdetail2.warn
UNION ALL
SELECT
    w_id, sgd_id, w_session_start_date, w_warn_type, w_database_name, w_timestamp, w_document_name, w_meter_code, w_access_method, w_encrypted_document_name, w_encryption_key, w_note
    FROM ccdetail3.warn
UNION ALL
SELECT
    w_id, sgd_id, w_session_start_date, w_warn_type, w_database_name, w_timestamp, w_document_name, w_meter_code, w_access_method, w_encrypted_document_name, w_encryption_key, w_note
    FROM ccdetail4.warn;

