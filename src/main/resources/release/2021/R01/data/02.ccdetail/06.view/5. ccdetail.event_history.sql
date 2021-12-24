CREATE OR REPLACE  VIEW ccdetail.event_history (eh_id, eh_date, eh_user_id, eh_session_id, eh_format, eh_domain, eh_event_type, eh_event_ver_code, eh_timestamp, eh_seq_num, eh_process_name, eh_ins_timestamp, eh_status_code, eh_environment, eh_source, eh_msg_queue_name, eh_event_data) AS
SELECT
    eh_id, eh_date, eh_user_id, eh_session_id, eh_format, eh_domain, eh_event_type, eh_event_ver_code, eh_timestamp, eh_seq_num, eh_process_name, eh_ins_timestamp, eh_status_code, eh_environment, eh_source, eh_msg_queue_name, eh_event_data
    FROM ccdetail1.event_history
UNION ALL
SELECT
    eh_id, eh_date, eh_user_id, eh_session_id, eh_format, eh_domain, eh_event_type, eh_event_ver_code, eh_timestamp, eh_seq_num, eh_process_name, eh_ins_timestamp, eh_status_code, eh_environment, eh_source, eh_msg_queue_name, eh_event_data
    FROM ccdetail2.event_history
UNION ALL
SELECT
    eh_id, eh_date, eh_user_id, eh_session_id, eh_format, eh_domain, eh_event_type, eh_event_ver_code, eh_timestamp, eh_seq_num, eh_process_name, eh_ins_timestamp, eh_status_code, eh_environment, eh_source, eh_msg_queue_name, eh_event_data
    FROM ccdetail3.event_history
UNION ALL
SELECT
    eh_id, eh_date, eh_user_id, eh_session_id, eh_format, eh_domain, eh_event_type, eh_event_ver_code, eh_timestamp, eh_seq_num, eh_process_name, eh_ins_timestamp, eh_status_code, eh_environment, eh_source, eh_msg_queue_name, eh_event_data
    FROM ccdetail4.event_history;

