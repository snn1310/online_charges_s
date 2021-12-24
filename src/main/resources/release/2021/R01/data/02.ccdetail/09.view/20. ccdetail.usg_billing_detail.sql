CREATE OR REPLACE  VIEW ccdetail.usg_billing_detail (ubd_usage_id, bd_id, ubd_session_start_date) AS
SELECT
    ubd_usage_id, bd_id, ubd_session_start_date
    FROM ccdetail1.usg_billing_detail
UNION ALL
SELECT
    ubd_usage_id, bd_id, ubd_session_start_date
    FROM ccdetail2.usg_billing_detail
UNION ALL
SELECT
    ubd_usage_id, bd_id, ubd_session_start_date
    FROM ccdetail3.usg_billing_detail
UNION ALL
SELECT
    ubd_usage_id, bd_id, ubd_session_start_date
    FROM ccdetail4.usg_billing_detail;

