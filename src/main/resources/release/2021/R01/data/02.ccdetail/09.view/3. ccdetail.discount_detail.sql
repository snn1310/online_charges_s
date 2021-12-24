CREATE OR REPLACE  VIEW ccdetail.discount_detail (dd_appl_order, bd_id, dd_session_start_date, bd_usage_date, dd_level_code, dd_promo_type, dd_cond_type, dd_promo_num, dd_cap_rank, dd_discount_usd, dd_discount_cur, dd_discount_pcnt, dd_domain, dd_company_id, dd_offer_id, dd_alloc_document, dd_alloc_item, dd_promo_code, dd_offer_channel) AS
SELECT
    dd_appl_order, bd_id, dd_session_start_date, bd_usage_date, dd_level_code, dd_promo_type, dd_cond_type, dd_promo_num, dd_cap_rank, dd_discount_usd, dd_discount_cur, dd_discount_pcnt, dd_domain, dd_company_id, dd_offer_id, dd_alloc_document, dd_alloc_item, dd_promo_code, dd_offer_channel
    FROM ccdetail1.discount_detail
UNION ALL
SELECT
    dd_appl_order, bd_id, dd_session_start_date, bd_usage_date, dd_level_code, dd_promo_type, dd_cond_type, dd_promo_num, dd_cap_rank, dd_discount_usd, dd_discount_cur, dd_discount_pcnt, dd_domain, dd_company_id, dd_offer_id, dd_alloc_document, dd_alloc_item, dd_promo_code, dd_offer_channel
    FROM ccdetail2.discount_detail
UNION ALL
SELECT
    dd_appl_order, bd_id, dd_session_start_date, bd_usage_date, dd_level_code, dd_promo_type, dd_cond_type, dd_promo_num, dd_cap_rank, dd_discount_usd, dd_discount_cur, dd_discount_pcnt, dd_domain, dd_company_id, dd_offer_id, dd_alloc_document, dd_alloc_item, dd_promo_code, dd_offer_channel
    FROM ccdetail3.discount_detail
UNION ALL
SELECT
    dd_appl_order, bd_id, dd_session_start_date, bd_usage_date, dd_level_code, dd_promo_type, dd_cond_type, dd_promo_num, dd_cap_rank, dd_discount_usd, dd_discount_cur, dd_discount_pcnt, dd_domain, dd_company_id, dd_offer_id, dd_alloc_document, dd_alloc_item, dd_promo_code, dd_offer_channel
    FROM ccdetail4.discount_detail;

