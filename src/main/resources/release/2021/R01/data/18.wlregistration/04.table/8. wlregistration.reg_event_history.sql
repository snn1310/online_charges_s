CREATE TABLE wlregistration.reg_event_history(
    event_id CHARACTER VARYING(33) NOT NULL,
    promotion_id CHARACTER VARYING(5) NOT NULL,
    event_date TIMESTAMP(6) WITHOUT TIME ZONE,
    event_type CHARACTER VARYING(15),
    reg_count BIGINT,
    modified_by CHARACTER VARYING(12) NOT NULL,
    mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN wlregistration.reg_event_history.modified_by
     IS 'Modified by, populated by trigger using function sys_context.';
COMMENT ON COLUMN wlregistration.reg_event_history.mod_timestamp
     IS 'Modified timestamp, populated by trigger using SYSDATE.';

