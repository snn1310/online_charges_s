CREATE OR REPLACE  VIEW ccdetail.billing_detail (bd_id, cd_id, bd_session_start_date, bd_usage_date, bd_domain, bd_usage_type, bd_prc_serv_type, bd_client_id_text, bd_database_name, bd_db_mat_num, bd_db_vendor_code, bd_db_general_ind, bd_usage_quantity, bd_charge_rule, bd_cls_mat_num, bd_product_code, bd_currency_code, bd_regov_chrg_usd, bd_regov_chrg_cur, bd_act_chrg_usd, bd_act_chrg_cur, bd_tier_code, bd_tier_percent, bd_incl_excl_ind, bd_sub_mat_num, bd_sub_document, bd_line_item_num, bd_grp_mat_num, bd_grp_table_name, bd_sdef_ind, bd_sdef_chrg_cur, bd_comp_code, bd_company_id, bd_price_quantity, bd_alloc_document, bd_alloc_item, bd_visible_code, bd_offer_id, bd_offer_channel, bd_capped_client_id, bd_orig_sdef_chrg_cur, bd_orig_sdef_ind) AS
SELECT
    bd_id, cd_id, bd_session_start_date, bd_usage_date, bd_domain, bd_usage_type, bd_prc_serv_type, bd_client_id_text, bd_database_name, bd_db_mat_num, bd_db_vendor_code, bd_db_general_ind, bd_usage_quantity, bd_charge_rule, bd_cls_mat_num, bd_product_code, bd_currency_code, bd_regov_chrg_usd, bd_regov_chrg_cur, bd_act_chrg_usd, bd_act_chrg_cur, bd_tier_code, bd_tier_percent, bd_incl_excl_ind, bd_sub_mat_num, bd_sub_document, bd_line_item_num, bd_grp_mat_num, bd_grp_table_name, bd_sdef_ind, bd_sdef_chrg_cur, bd_comp_code, bd_company_id, bd_price_quantity, bd_alloc_document, bd_alloc_item, bd_visible_code, bd_offer_id, bd_offer_channel, bd_capped_client_id, bd_orig_sdef_chrg_cur, bd_orig_sdef_ind
    FROM ccdetail1.billing_detail
UNION ALL
SELECT
    bd_id, cd_id, bd_session_start_date, bd_usage_date, bd_domain, bd_usage_type, bd_prc_serv_type, bd_client_id_text, bd_database_name, bd_db_mat_num, bd_db_vendor_code, bd_db_general_ind, bd_usage_quantity, bd_charge_rule, bd_cls_mat_num, bd_product_code, bd_currency_code, bd_regov_chrg_usd, bd_regov_chrg_cur, bd_act_chrg_usd, bd_act_chrg_cur, bd_tier_code, bd_tier_percent, bd_incl_excl_ind, bd_sub_mat_num, bd_sub_document, bd_line_item_num, bd_grp_mat_num, bd_grp_table_name, bd_sdef_ind, bd_sdef_chrg_cur, bd_comp_code, bd_company_id, bd_price_quantity, bd_alloc_document, bd_alloc_item, bd_visible_code, bd_offer_id, bd_offer_channel, bd_capped_client_id, bd_orig_sdef_chrg_cur, bd_orig_sdef_ind
    FROM ccdetail2.billing_detail
UNION ALL
SELECT
    bd_id, cd_id, bd_session_start_date, bd_usage_date, bd_domain, bd_usage_type, bd_prc_serv_type, bd_client_id_text, bd_database_name, bd_db_mat_num, bd_db_vendor_code, bd_db_general_ind, bd_usage_quantity, bd_charge_rule, bd_cls_mat_num, bd_product_code, bd_currency_code, bd_regov_chrg_usd, bd_regov_chrg_cur, bd_act_chrg_usd, bd_act_chrg_cur, bd_tier_code, bd_tier_percent, bd_incl_excl_ind, bd_sub_mat_num, bd_sub_document, bd_line_item_num, bd_grp_mat_num, bd_grp_table_name, bd_sdef_ind, bd_sdef_chrg_cur, bd_comp_code, bd_company_id, bd_price_quantity, bd_alloc_document, bd_alloc_item, bd_visible_code, bd_offer_id, bd_offer_channel, bd_capped_client_id, bd_orig_sdef_chrg_cur, bd_orig_sdef_ind
    FROM ccdetail3.billing_detail
UNION ALL
SELECT
    bd_id, cd_id, bd_session_start_date, bd_usage_date, bd_domain, bd_usage_type, bd_prc_serv_type, bd_client_id_text, bd_database_name, bd_db_mat_num, bd_db_vendor_code, bd_db_general_ind, bd_usage_quantity, bd_charge_rule, bd_cls_mat_num, bd_product_code, bd_currency_code, bd_regov_chrg_usd, bd_regov_chrg_cur, bd_act_chrg_usd, bd_act_chrg_cur, bd_tier_code, bd_tier_percent, bd_incl_excl_ind, bd_sub_mat_num, bd_sub_document, bd_line_item_num, bd_grp_mat_num, bd_grp_table_name, bd_sdef_ind, bd_sdef_chrg_cur, bd_comp_code, bd_company_id, bd_price_quantity, bd_alloc_document, bd_alloc_item, bd_visible_code, bd_offer_id, bd_offer_channel, bd_capped_client_id, bd_orig_sdef_chrg_cur, bd_orig_sdef_ind
    FROM ccdetail4.billing_detail;

