CREATE TABLE ccdetail2.event_history(
    eh_id CHARACTER VARYING(33) NOT NULL,
    eh_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    eh_user_id CHARACTER VARYING(33),
    eh_session_id CHARACTER VARYING(33) NOT NULL,
    eh_format CHARACTER(1) NOT NULL,
    eh_domain CHARACTER VARYING(15) NOT NULL,
    eh_event_type CHARACTER VARYING(18) NOT NULL,
    eh_event_ver_code CHARACTER VARYING(4) NOT NULL,
    eh_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    eh_seq_num BIGINT NOT NULL,
    eh_process_name CHARACTER VARYING(40) NOT NULL,
    eh_ins_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    eh_status_code CHARACTER(1) NOT NULL,
    eh_environment CHARACTER VARYING(18) NOT NULL,
    eh_source CHARACTER VARYING(33) NOT NULL,
    eh_msg_queue_name CHARACTER VARYING(50) NOT NULL,
    eh_event_data TEXT NOT NULL
)
    PARTITION BY RANGE (eh_date)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ccdetail2.event_history
     IS 'Event History';
COMMENT ON COLUMN ccdetail2.event_history.eh_id
     IS 'Generated id.';
COMMENT ON COLUMN ccdetail2.event_history.eh_date
     IS 'Event date, used for partitioning.';
COMMENT ON COLUMN ccdetail2.event_history.eh_user_id
     IS 'User id.';
COMMENT ON COLUMN ccdetail2.event_history.eh_session_id
     IS 'Session id.';
COMMENT ON COLUMN ccdetail2.event_history.eh_format
     IS 'Format';
COMMENT ON COLUMN ccdetail2.event_history.eh_domain
     IS 'Domain';
COMMENT ON COLUMN ccdetail2.event_history.eh_event_type
     IS 'Event type.';
COMMENT ON COLUMN ccdetail2.event_history.eh_event_ver_code
     IS 'Event version code.';
COMMENT ON COLUMN ccdetail2.event_history.eh_timestamp
     IS 'Event timestamp.';
COMMENT ON COLUMN ccdetail2.event_history.eh_seq_num
     IS 'Event sequence number.';
COMMENT ON COLUMN ccdetail2.event_history.eh_process_name
     IS 'Process name.';
COMMENT ON COLUMN ccdetail2.event_history.eh_ins_timestamp
     IS 'Row insert timestamp.';
COMMENT ON COLUMN ccdetail2.event_history.eh_status_code
     IS 'Event History status code.';
COMMENT ON COLUMN ccdetail2.event_history.eh_environment
     IS 'Environment';
COMMENT ON COLUMN ccdetail2.event_history.eh_source
     IS 'Event source.';
COMMENT ON COLUMN ccdetail2.event_history.eh_msg_queue_name
     IS 'Message queue name.';
COMMENT ON COLUMN ccdetail2.event_history.eh_event_data
     IS 'Event data.';

