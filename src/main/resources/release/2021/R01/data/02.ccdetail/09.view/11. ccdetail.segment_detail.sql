CREATE OR REPLACE  VIEW ccdetail.segment_detail (sgd_id, ssd_id, sgd_session_start_date, sgd_database_name, sgd_start_time, sgd_end_time, sgd_seconds, sgd_comp_code, sgd_client_id_text, sgd_meter_code, sgd_access_method, sgd_find_type, sgd_udm_ind, sgd_udm_id, sgd_doc_origin, sgd_doc_type, sgd_com_ov_flag, sgd_ct_ov_flag, sgd_db_ov_flag, sgd_price_code, sgd_tier_ind, sgd_tier_id, sgd_tier_code, sgd_trail_code, sgd_folder_code, sgd_research_description, sgd_research_reason_code, sgd_billable_ind, sgd_practice_area, sgd_trackable_code, sgd_capped_client_id, sgd_capped_billable_ind, sgd_cap_ind) AS
SELECT
    sgd_id, ssd_id, sgd_session_start_date, sgd_database_name, sgd_start_time, sgd_end_time, sgd_seconds, sgd_comp_code, sgd_client_id_text, sgd_meter_code, sgd_access_method, sgd_find_type, sgd_udm_ind, sgd_udm_id, sgd_doc_origin, sgd_doc_type, sgd_com_ov_flag, sgd_ct_ov_flag, sgd_db_ov_flag, sgd_price_code, sgd_tier_ind, sgd_tier_id, sgd_tier_code, sgd_trail_code, sgd_folder_code, sgd_research_description, sgd_research_reason_code, sgd_billable_ind, sgd_practice_area, sgd_trackable_code, sgd_capped_client_id, sgd_capped_billable_ind, sgd_cap_ind
    FROM ccdetail1.segment_detail
UNION ALL
SELECT
    sgd_id, ssd_id, sgd_session_start_date, sgd_database_name, sgd_start_time, sgd_end_time, sgd_seconds, sgd_comp_code, sgd_client_id_text, sgd_meter_code, sgd_access_method, sgd_find_type, sgd_udm_ind, sgd_udm_id, sgd_doc_origin, sgd_doc_type, sgd_com_ov_flag, sgd_ct_ov_flag, sgd_db_ov_flag, sgd_price_code, sgd_tier_ind, sgd_tier_id, sgd_tier_code, sgd_trail_code, sgd_folder_code, sgd_research_description, sgd_research_reason_code, sgd_billable_ind, sgd_practice_area, sgd_trackable_code, sgd_capped_client_id, sgd_capped_billable_ind, sgd_cap_ind
    FROM ccdetail2.segment_detail
UNION ALL
SELECT
    sgd_id, ssd_id, sgd_session_start_date, sgd_database_name, sgd_start_time, sgd_end_time, sgd_seconds, sgd_comp_code, sgd_client_id_text, sgd_meter_code, sgd_access_method, sgd_find_type, sgd_udm_ind, sgd_udm_id, sgd_doc_origin, sgd_doc_type, sgd_com_ov_flag, sgd_ct_ov_flag, sgd_db_ov_flag, sgd_price_code, sgd_tier_ind, sgd_tier_id, sgd_tier_code, sgd_trail_code, sgd_folder_code, sgd_research_description, sgd_research_reason_code, sgd_billable_ind, sgd_practice_area, sgd_trackable_code, sgd_capped_client_id, sgd_capped_billable_ind, sgd_cap_ind
    FROM ccdetail3.segment_detail
UNION ALL
SELECT
    sgd_id, ssd_id, sgd_session_start_date, sgd_database_name, sgd_start_time, sgd_end_time, sgd_seconds, sgd_comp_code, sgd_client_id_text, sgd_meter_code, sgd_access_method, sgd_find_type, sgd_udm_ind, sgd_udm_id, sgd_doc_origin, sgd_doc_type, sgd_com_ov_flag, sgd_ct_ov_flag, sgd_db_ov_flag, sgd_price_code, sgd_tier_ind, sgd_tier_id, sgd_tier_code, sgd_trail_code, sgd_folder_code, sgd_research_description, sgd_research_reason_code, sgd_billable_ind, sgd_practice_area, sgd_trackable_code, sgd_capped_client_id, sgd_capped_billable_ind, sgd_cap_ind
    FROM ccdetail4.segment_detail;

