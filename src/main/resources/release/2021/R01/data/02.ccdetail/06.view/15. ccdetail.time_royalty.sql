CREATE OR REPLACE  VIEW ccdetail.time_royalty (tir_id, sgd_id, tir_session_start_date, tir_royalty_id, tir_seconds, tir_format_code, tir_start_time, tir_comp_code, tir_multiplier) AS
SELECT
    tir_id, sgd_id, tir_session_start_date, tir_royalty_id, tir_seconds, tir_format_code, tir_start_time, tir_comp_code, tir_multiplier
    FROM ccdetail1.time_royalty
UNION ALL
SELECT
    tir_id, sgd_id, tir_session_start_date, tir_royalty_id, tir_seconds, tir_format_code, tir_start_time, tir_comp_code, tir_multiplier
    FROM ccdetail2.time_royalty
UNION ALL
SELECT
    tir_id, sgd_id, tir_session_start_date, tir_royalty_id, tir_seconds, tir_format_code, tir_start_time, tir_comp_code, tir_multiplier
    FROM ccdetail3.time_royalty
UNION ALL
SELECT
    tir_id, sgd_id, tir_session_start_date, tir_royalty_id, tir_seconds, tir_format_code, tir_start_time, tir_comp_code, tir_multiplier
    FROM ccdetail4.time_royalty;

