CREATE OR REPLACE  VIEW ccdetail.session_status (ss_session_id, ss_first_rec, ss_ses_start_rec, ss_ses_end_rec_sys, ss_ses_conn_eh_id, ss_first_mid_sys, ss_ses_connect_rec, ss_first_mid_rec, ss_software_type, ss_ses_reconn_ind, ss_process_ses_sys, ss_process_mid_sys, ss_mid_process_ind, ss_end_process_id, ss_pre_mid_ind, ss_modified_by, ss_mod_timestamp) AS
SELECT
    ss_session_id, ss_first_rec, ss_ses_start_rec, ss_ses_end_rec_sys, ss_ses_conn_eh_id, ss_first_mid_sys, ss_ses_connect_rec, ss_first_mid_rec, ss_software_type, ss_ses_reconn_ind, ss_process_ses_sys, ss_process_mid_sys, ss_mid_process_ind, ss_end_process_id, ss_pre_mid_ind, ss_modified_by, ss_mod_timestamp
    FROM ccdetail1.session_status
UNION ALL
SELECT
    ss_session_id, ss_first_rec, ss_ses_start_rec, ss_ses_end_rec_sys, ss_ses_conn_eh_id, ss_first_mid_sys, ss_ses_connect_rec, ss_first_mid_rec, ss_software_type, ss_ses_reconn_ind, ss_process_ses_sys, ss_process_mid_sys, ss_mid_process_ind, ss_end_process_id, ss_pre_mid_ind, ss_modified_by, ss_mod_timestamp
    FROM ccdetail2.session_status
UNION ALL
SELECT
    ss_session_id, ss_first_rec, ss_ses_start_rec, ss_ses_end_rec_sys, ss_ses_conn_eh_id, ss_first_mid_sys, ss_ses_connect_rec, ss_first_mid_rec, ss_software_type, ss_ses_reconn_ind, ss_process_ses_sys, ss_process_mid_sys, ss_mid_process_ind, ss_end_process_id, ss_pre_mid_ind, ss_modified_by, ss_mod_timestamp
    FROM ccdetail3.session_status
UNION ALL
SELECT
    ss_session_id, ss_first_rec, ss_ses_start_rec, ss_ses_end_rec_sys, ss_ses_conn_eh_id, ss_first_mid_sys, ss_ses_connect_rec, ss_first_mid_rec, ss_software_type, ss_ses_reconn_ind, ss_process_ses_sys, ss_process_mid_sys, ss_mid_process_ind, ss_end_process_id, ss_pre_mid_ind, ss_modified_by, ss_mod_timestamp
    FROM ccdetail4.session_status;

