CREATE OR REPLACE  VIEW ocsumm.usage (u_id, c_id, u_domain, u_company_id, u_date, u_software_type, u_software_ver, u_onl_serv_type, u_billing_option, u_platform_code, u_usage_type, u_prc_serv_type, u_client_id_text, u_database_name, u_db_mat_num, u_db_vendor_code, u_db_general_ind, u_usage_quantity, u_charge_rule, u_cls_mat_num, u_product_code, u_currency_code, u_regov_chrg_usd, u_regov_chrg_cur, u_act_chrg_usd, u_act_chrg_cur, u_tier_code_price, u_tier_percent, u_incl_excl_ind, u_sub_mat_num, u_sub_document, u_line_item, u_grp_mat_num, u_grp_table_name, u_sdef_ind, u_sdef_chrg_cur, u_doc_cnt, u_line_cnt, u_page_cnt, u_results_ind, u_meter_code, u_udm_ind, u_comp_code, u_access_method, u_request_source, u_request_ver, u_trail_code, u_format_code, u_dest_code, u_frequency_code, u_search_type, u_find_type, u_unique_code, u_repeat_code, u_doc_origin, u_doc_type, u_price_code, u_reprint_ind, u_group_type, u_group_id, u_session_type, u_confirm_num, u_part_cnt, u_tran_cnt, u_date_submitted, u_command_type, u_tier_code_usage, u_folder_code, u_alloc_document, u_alloc_item, u_quote_item_id, u_royalty_hash, u_discount_hash, u_inplan_hash, u_visible_code, u_offer_id, u_offer_channel, u_billable_ind) AS
SELECT
    u_id, c_id, u_domain, u_company_id, u_date, u_software_type, u_software_ver, u_onl_serv_type, u_billing_option, u_platform_code, u_usage_type, u_prc_serv_type, u_client_id_text, u_database_name, u_db_mat_num, u_db_vendor_code, u_db_general_ind, u_usage_quantity, u_charge_rule, u_cls_mat_num, u_product_code, u_currency_code, u_regov_chrg_usd, u_regov_chrg_cur, u_act_chrg_usd, u_act_chrg_cur, u_tier_code_price, u_tier_percent, u_incl_excl_ind, u_sub_mat_num, u_sub_document, u_line_item, u_grp_mat_num, u_grp_table_name, u_sdef_ind, u_sdef_chrg_cur, u_doc_cnt, u_line_cnt, u_page_cnt, u_results_ind, u_meter_code, u_udm_ind, u_comp_code, u_access_method, u_request_source, u_request_ver, u_trail_code, u_format_code, u_dest_code, u_frequency_code, u_search_type, u_find_type, u_unique_code, u_repeat_code, u_doc_origin, u_doc_type, u_price_code, u_reprint_ind, u_group_type, u_group_id, u_session_type, u_confirm_num, u_part_cnt, u_tran_cnt, u_date_submitted, u_command_type, u_tier_code_usage, u_folder_code, u_alloc_document, u_alloc_item, u_quote_item_id, u_royalty_hash, u_discount_hash, u_inplan_hash, u_visible_code, u_offer_id, u_offer_channel, u_billable_ind
    FROM ocsumm1.usage
UNION ALL
SELECT
    u_id, c_id, u_domain, u_company_id, u_date, u_software_type, u_software_ver, u_onl_serv_type, u_billing_option, u_platform_code, u_usage_type, u_prc_serv_type, u_client_id_text, u_database_name, u_db_mat_num, u_db_vendor_code, u_db_general_ind, u_usage_quantity, u_charge_rule, u_cls_mat_num, u_product_code, u_currency_code, u_regov_chrg_usd, u_regov_chrg_cur, u_act_chrg_usd, u_act_chrg_cur, u_tier_code_price, u_tier_percent, u_incl_excl_ind, u_sub_mat_num, u_sub_document, u_line_item, u_grp_mat_num, u_grp_table_name, u_sdef_ind, u_sdef_chrg_cur, u_doc_cnt, u_line_cnt, u_page_cnt, u_results_ind, u_meter_code, u_udm_ind, u_comp_code, u_access_method, u_request_source, u_request_ver, u_trail_code, u_format_code, u_dest_code, u_frequency_code, u_search_type, u_find_type, u_unique_code, u_repeat_code, u_doc_origin, u_doc_type, u_price_code, u_reprint_ind, u_group_type, u_group_id, u_session_type, u_confirm_num, u_part_cnt, u_tran_cnt, u_date_submitted, u_command_type, u_tier_code_usage, u_folder_code, u_alloc_document, u_alloc_item, u_quote_item_id, u_royalty_hash, u_discount_hash, u_inplan_hash, u_visible_code, u_offer_id, u_offer_channel, u_billable_ind
    FROM ocsumm2.usage;
