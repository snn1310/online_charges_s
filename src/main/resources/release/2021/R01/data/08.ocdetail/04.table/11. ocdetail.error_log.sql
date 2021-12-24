CREATE TABLE ocdetail.error_log(
    el_id CHARACTER VARYING(33) NOT NULL,
    el_ins_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    eh_id CHARACTER VARYING(33),
    el_user_id CHARACTER VARYING(33),
    el_severity_code CHARACTER VARYING(10) NOT NULL,
    el_message_text CHARACTER VARYING(1000) NOT NULL,
    el_category_code CHARACTER VARYING(40) NOT NULL,
    el_process_name CHARACTER VARYING(40) NOT NULL,
    el_context_data CHARACTER VARYING(255) NOT NULL,
    el_stack_trace CHARACTER VARYING(4000) NOT NULL,
    el_ins_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    el_cause_id CHARACTER VARYING(33),
    el_domain CHARACTER VARYING(15),
    el_short_message CHARACTER VARYING(80),
    el_bill_grp CHARACTER VARYING(10),
    el_onl_serv_type CHARACTER VARYING(4),
    el_company_code CHARACTER VARYING(4),
    el_session_id CHARACTER VARYING(33)
)
    PARTITION BY RANGE (el_ins_date)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocdetail.error_log
     IS 'Online Charges Error Log';
COMMENT ON COLUMN ocdetail.error_log.el_id
     IS 'Generated id.';
COMMENT ON COLUMN ocdetail.error_log.el_ins_date
     IS 'Error log insert date, used for partitioning.';
COMMENT ON COLUMN ocdetail.error_log.eh_id
     IS 'Generated id.';
COMMENT ON COLUMN ocdetail.error_log.el_user_id
     IS 'User id.';
COMMENT ON COLUMN ocdetail.error_log.el_severity_code
     IS 'Error severity code.';
COMMENT ON COLUMN ocdetail.error_log.el_message_text
     IS 'Error message text.';
COMMENT ON COLUMN ocdetail.error_log.el_category_code
     IS 'Error category code.';
COMMENT ON COLUMN ocdetail.error_log.el_process_name
     IS 'Process name of error origination.';
COMMENT ON COLUMN ocdetail.error_log.el_context_data
     IS 'Context data.';
COMMENT ON COLUMN ocdetail.error_log.el_stack_trace
     IS 'Stack trace.';
COMMENT ON COLUMN ocdetail.error_log.el_ins_timestamp
     IS 'Row insert timestamp.';
COMMENT ON COLUMN ocdetail.error_log.el_cause_id
     IS 'Cause OC_ERROR_LOG id.';
COMMENT ON COLUMN ocdetail.error_log.el_domain
     IS 'Domain.';
COMMENT ON COLUMN ocdetail.error_log.el_short_message
     IS 'Short message.';
COMMENT ON COLUMN ocdetail.error_log.el_session_id
     IS 'Session id.';

