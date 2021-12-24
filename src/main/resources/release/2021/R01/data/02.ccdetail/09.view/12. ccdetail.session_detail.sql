CREATE OR REPLACE  VIEW ccdetail.session_detail (ssd_id, ssd_session_start_date, ssd_user_id, ssd_session_id, ssd_domain, ssd_session_type, ssd_start_time, ssd_end_time, ssd_seconds, ssd_comp_code, ssd_software_type, ssd_software_ver, ssd_meter_code, ssd_onl_serv_type, ssd_billing_option, ssd_platform_code, ssd_net_orig_addr, ssd_net_dest_addr, ssd_net_trunk_name, ssd_net_speed, ssd_front_end_proc, ssd_onl_session_id, ssd_dest_code, ssd_print_bill_opt, ssd_print_copy_cnt, ssd_onl_session_bill_opt) AS
SELECT
    ssd_id, ssd_session_start_date, ssd_user_id, ssd_session_id, ssd_domain, ssd_session_type, ssd_start_time, ssd_end_time, ssd_seconds, ssd_comp_code, ssd_software_type, ssd_software_ver, ssd_meter_code, ssd_onl_serv_type, ssd_billing_option, ssd_platform_code, ssd_net_orig_addr, ssd_net_dest_addr, ssd_net_trunk_name, ssd_net_speed, ssd_front_end_proc, ssd_onl_session_id, ssd_dest_code, ssd_print_bill_opt, ssd_print_copy_cnt, ssd_onl_session_bill_opt
    FROM ccdetail1.session_detail
UNION ALL
SELECT
    ssd_id, ssd_session_start_date, ssd_user_id, ssd_session_id, ssd_domain, ssd_session_type, ssd_start_time, ssd_end_time, ssd_seconds, ssd_comp_code, ssd_software_type, ssd_software_ver, ssd_meter_code, ssd_onl_serv_type, ssd_billing_option, ssd_platform_code, ssd_net_orig_addr, ssd_net_dest_addr, ssd_net_trunk_name, ssd_net_speed, ssd_front_end_proc, ssd_onl_session_id, ssd_dest_code, ssd_print_bill_opt, ssd_print_copy_cnt, ssd_onl_session_bill_opt
    FROM ccdetail2.session_detail
UNION ALL
SELECT
    ssd_id, ssd_session_start_date, ssd_user_id, ssd_session_id, ssd_domain, ssd_session_type, ssd_start_time, ssd_end_time, ssd_seconds, ssd_comp_code, ssd_software_type, ssd_software_ver, ssd_meter_code, ssd_onl_serv_type, ssd_billing_option, ssd_platform_code, ssd_net_orig_addr, ssd_net_dest_addr, ssd_net_trunk_name, ssd_net_speed, ssd_front_end_proc, ssd_onl_session_id, ssd_dest_code, ssd_print_bill_opt, ssd_print_copy_cnt, ssd_onl_session_bill_opt
    FROM ccdetail3.session_detail
UNION ALL
SELECT
    ssd_id, ssd_session_start_date, ssd_user_id, ssd_session_id, ssd_domain, ssd_session_type, ssd_start_time, ssd_end_time, ssd_seconds, ssd_comp_code, ssd_software_type, ssd_software_ver, ssd_meter_code, ssd_onl_serv_type, ssd_billing_option, ssd_platform_code, ssd_net_orig_addr, ssd_net_dest_addr, ssd_net_trunk_name, ssd_net_speed, ssd_front_end_proc, ssd_onl_session_id, ssd_dest_code, ssd_print_bill_opt, ssd_print_copy_cnt, ssd_onl_session_bill_opt
    FROM ccdetail4.session_detail;

