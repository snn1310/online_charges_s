CREATE OR REPLACE  VIEW ccdetail.roy_tran_usg_pricing (rtup_id, cd_id, rtu_id, rtup_session_start_date, rtup_usage_date, rtup_usage_type, rtup_db_mat_num, rtup_vendor_code) AS
SELECT
    rtup_id, cd_id, rtu_id, rtup_session_start_date, rtup_usage_date, rtup_usage_type, rtup_db_mat_num, rtup_vendor_code
    FROM ccdetail1.roy_tran_usg_pricing
UNION ALL
SELECT
    rtup_id, cd_id, rtu_id, rtup_session_start_date, rtup_usage_date, rtup_usage_type, rtup_db_mat_num, rtup_vendor_code
    FROM ccdetail2.roy_tran_usg_pricing
UNION ALL
SELECT
    rtup_id, cd_id, rtu_id, rtup_session_start_date, rtup_usage_date, rtup_usage_type, rtup_db_mat_num, rtup_vendor_code
    FROM ccdetail3.roy_tran_usg_pricing
UNION ALL
SELECT
    rtup_id, cd_id, rtu_id, rtup_session_start_date, rtup_usage_date, rtup_usage_type, rtup_db_mat_num, rtup_vendor_code
    FROM ccdetail4.roy_tran_usg_pricing;

