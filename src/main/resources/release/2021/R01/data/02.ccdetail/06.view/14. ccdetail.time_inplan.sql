CREATE OR REPLACE  VIEW ccdetail.time_inplan (tii_id, sgd_id, tii_session_start_date, tii_database_name, tii_pricing_type, tii_pricing_num, tii_access_method) AS
SELECT
    tii_id, sgd_id, tii_session_start_date, tii_database_name, tii_pricing_type, tii_pricing_num, tii_access_method
    FROM ccdetail1.time_inplan
UNION ALL
SELECT
    tii_id, sgd_id, tii_session_start_date, tii_database_name, tii_pricing_type, tii_pricing_num, tii_access_method
    FROM ccdetail2.time_inplan
UNION ALL
SELECT
    tii_id, sgd_id, tii_session_start_date, tii_database_name, tii_pricing_type, tii_pricing_num, tii_access_method
    FROM ccdetail3.time_inplan
UNION ALL
SELECT
    tii_id, sgd_id, tii_session_start_date, tii_database_name, tii_pricing_type, tii_pricing_num, tii_access_method
    FROM ccdetail4.time_inplan;

