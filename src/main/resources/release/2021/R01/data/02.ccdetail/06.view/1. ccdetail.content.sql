CREATE OR REPLACE  VIEW ccdetail.content (con_id, tu_id, con_session_start_date, con_type) AS
SELECT
    con_id, tu_id, con_session_start_date, con_type
    FROM ccdetail1.content
UNION ALL
SELECT
    con_id, tu_id, con_session_start_date, con_type
    FROM ccdetail2.content
UNION ALL
SELECT
    con_id, tu_id, con_session_start_date, con_type
    FROM ccdetail3.content
UNION ALL
SELECT
    con_id, tu_id, con_session_start_date, con_type
    FROM ccdetail4.content;

