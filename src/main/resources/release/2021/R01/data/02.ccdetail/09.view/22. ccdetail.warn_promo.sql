CREATE OR REPLACE  VIEW ccdetail.warn_promo (wp_id, w_id, wp_session_start_date, wp_promo_num) AS
SELECT
    wp_id, w_id, wp_session_start_date, wp_promo_num
    FROM ccdetail1.warn_promo
UNION ALL
SELECT
    wp_id, w_id, wp_session_start_date, wp_promo_num
    FROM ccdetail2.warn_promo
UNION ALL
SELECT
    wp_id, w_id, wp_session_start_date, wp_promo_num
    FROM ccdetail3.warn_promo
UNION ALL
SELECT
    wp_id, w_id, wp_session_start_date, wp_promo_num
    FROM ccdetail4.warn_promo;

