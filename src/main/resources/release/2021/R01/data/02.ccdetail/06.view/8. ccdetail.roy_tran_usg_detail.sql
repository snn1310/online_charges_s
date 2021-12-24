CREATE OR REPLACE  VIEW ccdetail.roy_tran_usg_detail (rtud_id, rtu_id, rtud_session_start_date, rtud_royalty_id, rtud_doc_cnt, rtud_from_tu_id) AS
SELECT
    rtud_id, rtu_id, rtud_session_start_date, rtud_royalty_id, rtud_doc_cnt, rtud_from_tu_id
    FROM ccdetail1.roy_tran_usg_detail
UNION ALL
SELECT
    rtud_id, rtu_id, rtud_session_start_date, rtud_royalty_id, rtud_doc_cnt, rtud_from_tu_id
    FROM ccdetail2.roy_tran_usg_detail
UNION ALL
SELECT
    rtud_id, rtu_id, rtud_session_start_date, rtud_royalty_id, rtud_doc_cnt, rtud_from_tu_id
    FROM ccdetail3.roy_tran_usg_detail
UNION ALL
SELECT
    rtud_id, rtu_id, rtud_session_start_date, rtud_royalty_id, rtud_doc_cnt, rtud_from_tu_id
    FROM ccdetail4.roy_tran_usg_detail;

