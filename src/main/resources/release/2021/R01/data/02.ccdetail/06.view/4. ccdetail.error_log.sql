CREATE OR REPLACE  VIEW ccdetail.error_log (el_id, el_ins_date, eh_id, el_user_id, el_severity_code, el_message_text, el_category_code, el_process_name, el_context_data, el_stack_trace, el_ins_timestamp, el_cause_id, el_domain, el_short_message, el_bill_grp, el_onl_serv_type, el_company_code, el_session_id) AS
SELECT
    el_id, el_ins_date, eh_id, el_user_id, el_severity_code, el_message_text, el_category_code, el_process_name, el_context_data, el_stack_trace, el_ins_timestamp, el_cause_id, el_domain, el_short_message, el_bill_grp, el_onl_serv_type, el_company_code, el_session_id
    FROM ccdetail1.error_log
UNION ALL
SELECT
    el_id, el_ins_date, eh_id, el_user_id, el_severity_code, el_message_text, el_category_code, el_process_name, el_context_data, el_stack_trace, el_ins_timestamp, el_cause_id, el_domain, el_short_message, el_bill_grp, el_onl_serv_type, el_company_code, el_session_id
    FROM ccdetail2.error_log
UNION ALL
SELECT
    el_id, el_ins_date, eh_id, el_user_id, el_severity_code, el_message_text, el_category_code, el_process_name, el_context_data, el_stack_trace, el_ins_timestamp, el_cause_id, el_domain, el_short_message, el_bill_grp, el_onl_serv_type, el_company_code, el_session_id
    FROM ccdetail3.error_log
UNION ALL
SELECT
    el_id, el_ins_date, eh_id, el_user_id, el_severity_code, el_message_text, el_category_code, el_process_name, el_context_data, el_stack_trace, el_ins_timestamp, el_cause_id, el_domain, el_short_message, el_bill_grp, el_onl_serv_type, el_company_code, el_session_id
    FROM ccdetail4.error_log;

