CREATE OR REPLACE  VIEW ccdetail.tran_inplan (tri_id, tu_id, tri_session_start_date, tri_database_name, tri_pricing_type, tri_pricing_num, tri_access_method) AS
SELECT
    tri_id, tu_id, tri_session_start_date, tri_database_name, tri_pricing_type, tri_pricing_num, tri_access_method
    FROM ccdetail1.tran_inplan
UNION ALL
SELECT
    tri_id, tu_id, tri_session_start_date, tri_database_name, tri_pricing_type, tri_pricing_num, tri_access_method
    FROM ccdetail2.tran_inplan
UNION ALL
SELECT
    tri_id, tu_id, tri_session_start_date, tri_database_name, tri_pricing_type, tri_pricing_num, tri_access_method
    FROM ccdetail3.tran_inplan
UNION ALL
SELECT
    tri_id, tu_id, tri_session_start_date, tri_database_name, tri_pricing_type, tri_pricing_num, tri_access_method
    FROM ccdetail4.tran_inplan;

