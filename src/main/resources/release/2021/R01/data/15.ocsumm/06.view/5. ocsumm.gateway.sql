CREATE OR REPLACE  VIEW ocsumm.gateway (g_id, c_id, g_domain, g_company_id, g_date, g_database_name, g_gateway_type, g_pool_code, g_doc_req_cnt, g_doc_view_cnt, g_cite_req_cnt, g_cite_view_cnt, g_image_req_cnt, g_locate_doc_cnt) AS
SELECT
    g_id, c_id, g_domain, g_company_id, g_date, g_database_name, g_gateway_type, g_pool_code, g_doc_req_cnt, g_doc_view_cnt, g_cite_req_cnt, g_cite_view_cnt, g_image_req_cnt, g_locate_doc_cnt
    FROM ocsumm1.gateway
UNION ALL
SELECT
    g_id, c_id, g_domain, g_company_id, g_date, g_database_name, g_gateway_type, g_pool_code, g_doc_req_cnt, g_doc_view_cnt, g_cite_req_cnt, g_cite_view_cnt, g_image_req_cnt, g_locate_doc_cnt
    FROM ocsumm2.gateway;

