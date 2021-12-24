CREATE OR REPLACE  VIEW ocsumm.session_detail (sd_id, c_id, sd_domain, sd_company_id, sd_end_date, sd_session_id, sd_session_type, sd_start_time, sd_end_time, sd_seconds, sd_comp_code, sd_software_type, sd_software_ver, sd_meter_code, sd_onl_serv_type, sd_billing_option, sd_platform_code, sd_net_orig_addr, sd_net_dest_addr, sd_net_trunk_name, sd_net_speed, sd_front_end_proc, sd_onl_session_id, sd_dest_code) AS
SELECT
    sd_id, c_id, sd_domain, sd_company_id, sd_end_date, sd_session_id, sd_session_type, sd_start_time, sd_end_time, sd_seconds, sd_comp_code, sd_software_type, sd_software_ver, sd_meter_code, sd_onl_serv_type, sd_billing_option, sd_platform_code, sd_net_orig_addr, sd_net_dest_addr, sd_net_trunk_name, sd_net_speed, sd_front_end_proc, sd_onl_session_id, sd_dest_code
    FROM ocsumm1.session_detail
UNION ALL
SELECT
    sd_id, c_id, sd_domain, sd_company_id, sd_end_date, sd_session_id, sd_session_type, sd_start_time, sd_end_time, sd_seconds, sd_comp_code, sd_software_type, sd_software_ver, sd_meter_code, sd_onl_serv_type, sd_billing_option, sd_platform_code, sd_net_orig_addr, sd_net_dest_addr, sd_net_trunk_name, sd_net_speed, sd_front_end_proc, sd_onl_session_id, sd_dest_code
    FROM ocsumm2.session_detail;

