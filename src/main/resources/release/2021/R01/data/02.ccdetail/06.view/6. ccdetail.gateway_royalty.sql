CREATE OR REPLACE  VIEW ccdetail.gateway_royalty (gr_id, sgd_id, gr_session_start_date, gr_gateway_type, gr_database_name, gr_timestamp, gr_pool_code, gr_doc_req_cnt, gr_doc_view_cnt, gr_cite_req_cnt, gr_cite_view_cnt, gr_image_req_cnt, gr_locate_doc_cnt) AS
SELECT
    gr_id, sgd_id, gr_session_start_date, gr_gateway_type, gr_database_name, gr_timestamp, gr_pool_code, gr_doc_req_cnt, gr_doc_view_cnt, gr_cite_req_cnt, gr_cite_view_cnt, gr_image_req_cnt, gr_locate_doc_cnt
    FROM ccdetail1.gateway_royalty
UNION ALL
SELECT
    gr_id, sgd_id, gr_session_start_date, gr_gateway_type, gr_database_name, gr_timestamp, gr_pool_code, gr_doc_req_cnt, gr_doc_view_cnt, gr_cite_req_cnt, gr_cite_view_cnt, gr_image_req_cnt, gr_locate_doc_cnt
    FROM ccdetail2.gateway_royalty
UNION ALL
SELECT
    gr_id, sgd_id, gr_session_start_date, gr_gateway_type, gr_database_name, gr_timestamp, gr_pool_code, gr_doc_req_cnt, gr_doc_view_cnt, gr_cite_req_cnt, gr_cite_view_cnt, gr_image_req_cnt, gr_locate_doc_cnt
    FROM ccdetail3.gateway_royalty
UNION ALL
SELECT
    gr_id, sgd_id, gr_session_start_date, gr_gateway_type, gr_database_name, gr_timestamp, gr_pool_code, gr_doc_req_cnt, gr_doc_view_cnt, gr_cite_req_cnt, gr_cite_view_cnt, gr_image_req_cnt, gr_locate_doc_cnt
    FROM ccdetail4.gateway_royalty;

