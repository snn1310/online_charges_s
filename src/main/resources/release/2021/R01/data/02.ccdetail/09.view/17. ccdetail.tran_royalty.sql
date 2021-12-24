CREATE OR REPLACE  VIEW ccdetail.tran_royalty (trr_id, tu_id, trr_session_start_date, trr_royalty_id, trr_char_cnt, trr_line_cnt, trr_doc_cnt, trr_royalty_data, trr_from_tu_id, trr_disp_surcharge_ind) AS
SELECT
    trr_id, tu_id, trr_session_start_date, trr_royalty_id, trr_char_cnt, trr_line_cnt, trr_doc_cnt, trr_royalty_data, trr_from_tu_id, trr_disp_surcharge_ind
    FROM ccdetail1.tran_royalty
UNION ALL
SELECT
    trr_id, tu_id, trr_session_start_date, trr_royalty_id, trr_char_cnt, trr_line_cnt, trr_doc_cnt, trr_royalty_data, trr_from_tu_id, trr_disp_surcharge_ind
    FROM ccdetail2.tran_royalty
UNION ALL
SELECT
    trr_id, tu_id, trr_session_start_date, trr_royalty_id, trr_char_cnt, trr_line_cnt, trr_doc_cnt, trr_royalty_data, trr_from_tu_id, trr_disp_surcharge_ind
    FROM ccdetail3.tran_royalty
UNION ALL
SELECT
    trr_id, tu_id, trr_session_start_date, trr_royalty_id, trr_char_cnt, trr_line_cnt, trr_doc_cnt, trr_royalty_data, trr_from_tu_id, trr_disp_surcharge_ind
    FROM ccdetail4.tran_royalty;

