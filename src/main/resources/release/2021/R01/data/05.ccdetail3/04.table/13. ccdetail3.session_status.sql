CREATE TABLE ccdetail3.session_status(
    ss_session_id CHARACTER VARYING(33) NOT NULL,
    ss_first_rec TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    ss_ses_start_rec TIMESTAMP(6) WITHOUT TIME ZONE,
    ss_ses_end_rec_sys TIMESTAMP(6) WITHOUT TIME ZONE,
    ss_ses_conn_eh_id CHARACTER VARYING(33),
    ss_first_mid_sys TIMESTAMP(6) WITHOUT TIME ZONE,
    ss_ses_connect_rec TIMESTAMP(6) WITHOUT TIME ZONE,
    ss_first_mid_rec TIMESTAMP(6) WITHOUT TIME ZONE,
    ss_software_type CHARACTER VARYING(2),
    ss_ses_reconn_ind CHARACTER(1) NOT NULL,
    ss_process_ses_sys TIMESTAMP(6) WITHOUT TIME ZONE,
    ss_process_mid_sys TIMESTAMP(6) WITHOUT TIME ZONE,
    ss_mid_process_ind CHARACTER(1) NOT NULL,
    ss_end_process_id CHARACTER VARYING(6),
    ss_pre_mid_ind CHARACTER(1) NOT NULL,
    ss_modified_by CHARACTER VARYING(12) NOT NULL,
    ss_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ccdetail3.session_status
     IS 'Session Status';
COMMENT ON COLUMN ccdetail3.session_status.ss_session_id
     IS 'Session id.';
COMMENT ON COLUMN ccdetail3.session_status.ss_modified_by
     IS 'Modified by.';
COMMENT ON COLUMN ccdetail3.session_status.ss_mod_timestamp
     IS 'Modified timestamp.';

