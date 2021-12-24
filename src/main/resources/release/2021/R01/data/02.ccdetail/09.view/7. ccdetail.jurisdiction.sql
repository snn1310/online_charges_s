CREATE OR REPLACE  VIEW ccdetail.jurisdiction (j_id, tu_id, j_session_start_date, j_name) AS
SELECT
    j_id, tu_id, j_session_start_date, j_name
    FROM ccdetail1.jurisdiction
UNION ALL
SELECT
    j_id, tu_id, j_session_start_date, j_name
    FROM ccdetail2.jurisdiction
UNION ALL
SELECT
    j_id, tu_id, j_session_start_date, j_name
    FROM ccdetail3.jurisdiction
UNION ALL
SELECT
    j_id, tu_id, j_session_start_date, j_name
    FROM ccdetail4.jurisdiction;

