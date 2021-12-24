CREATE OR REPLACE  VIEW ccdetail.royalty_tran_usage (rtu_id, sgd_id, rtu_session_start_date, rtu_tran_type, rtu_timestamp, rtu_access_method, rtu_repeat_code, rtu_trail_code, rtu_request_source, rtu_request_ver, rtu_database_name, rtu_format_code, rtu_doc_id, rtu_doc_name, rtu_reason_codes, rtu_tran_cnt, rtu_rank) AS
SELECT
    rtu_id, sgd_id, rtu_session_start_date, rtu_tran_type, rtu_timestamp, rtu_access_method, rtu_repeat_code, rtu_trail_code, rtu_request_source, rtu_request_ver, rtu_database_name, rtu_format_code, rtu_doc_id, rtu_doc_name, rtu_reason_codes, rtu_tran_cnt, rtu_rank
    FROM ccdetail1.royalty_tran_usage
UNION ALL
SELECT
    rtu_id, sgd_id, rtu_session_start_date, rtu_tran_type, rtu_timestamp, rtu_access_method, rtu_repeat_code, rtu_trail_code, rtu_request_source, rtu_request_ver, rtu_database_name, rtu_format_code, rtu_doc_id, rtu_doc_name, rtu_reason_codes, rtu_tran_cnt, rtu_rank
    FROM ccdetail2.royalty_tran_usage
UNION ALL
SELECT
    rtu_id, sgd_id, rtu_session_start_date, rtu_tran_type, rtu_timestamp, rtu_access_method, rtu_repeat_code, rtu_trail_code, rtu_request_source, rtu_request_ver, rtu_database_name, rtu_format_code, rtu_doc_id, rtu_doc_name, rtu_reason_codes, rtu_tran_cnt, rtu_rank
    FROM ccdetail3.royalty_tran_usage
UNION ALL
SELECT
    rtu_id, sgd_id, rtu_session_start_date, rtu_tran_type, rtu_timestamp, rtu_access_method, rtu_repeat_code, rtu_trail_code, rtu_request_source, rtu_request_ver, rtu_database_name, rtu_format_code, rtu_doc_id, rtu_doc_name, rtu_reason_codes, rtu_tran_cnt, rtu_rank
    FROM ccdetail4.royalty_tran_usage;

