CREATE OR REPLACE  VIEW ocsumm.royalty_usage (ru_id, c_id, ru_domain, ru_company_id, ru_date, ru_usage_type, ru_unit_cnt, ru_access_method, ru_repeat_code, ru_trail_code, ru_request_source, ru_request_ver, ru_database_name, ru_format_code, ru_doc_id, ru_doc_name, ru_royalty_id, ru_doc_cnt, ru_from_usage_id, ru_db_mat_num, ru_vendor_code) AS
SELECT
    ru_id, c_id, ru_domain, ru_company_id, ru_date, ru_usage_type, ru_unit_cnt, ru_access_method, ru_repeat_code, ru_trail_code, ru_request_source, ru_request_ver, ru_database_name, ru_format_code, ru_doc_id, ru_doc_name, ru_royalty_id, ru_doc_cnt, ru_from_usage_id, ru_db_mat_num, ru_vendor_code
    FROM ocsumm1.royalty_usage
UNION ALL
SELECT
    ru_id, c_id, ru_domain, ru_company_id, ru_date, ru_usage_type, ru_unit_cnt, ru_access_method, ru_repeat_code, ru_trail_code, ru_request_source, ru_request_ver, ru_database_name, ru_format_code, ru_doc_id, ru_doc_name, ru_royalty_id, ru_doc_cnt, ru_from_usage_id, ru_db_mat_num, ru_vendor_code
    FROM ocsumm2.royalty_usage;

