CREATE OR REPLACE  VIEW ocsumm.discount (d_appl_order, u_id, c_id, d_domain, d_company_id, d_date, d_level_code, d_promo_type, d_cond_type, d_promo_num, d_cap_rank, d_discount_usd, d_discount_cur, d_discount_pcnt, d_offer_id, d_promo_applied, d_alloc_document, d_alloc_item, d_promo_code, d_offer_channel) AS
SELECT
    d_appl_order, u_id, c_id, d_domain, d_company_id, d_date, d_level_code, d_promo_type, d_cond_type, d_promo_num, d_cap_rank, d_discount_usd, d_discount_cur, d_discount_pcnt, d_offer_id, d_promo_applied, d_alloc_document, d_alloc_item, d_promo_code, d_offer_channel
    FROM ocsumm1.discount
UNION ALL
SELECT
    d_appl_order, u_id, c_id, d_domain, d_company_id, d_date, d_level_code, d_promo_type, d_cond_type, d_promo_num, d_cap_rank, d_discount_usd, d_discount_cur, d_discount_pcnt, d_offer_id, d_promo_applied, d_alloc_document, d_alloc_item, d_promo_code, d_offer_channel
    FROM ocsumm2.discount;

