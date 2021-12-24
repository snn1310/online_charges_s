CREATE TABLE wlregistration.reg_count_notify(
    notify_id CHARACTER VARYING(16) NOT NULL,
    promotion_id CHARACTER VARYING(5) NOT NULL,
    email CHARACTER VARYING(50),
    daily CHARACTER(1),
    total CHARACTER(1),
    modified_by CHARACTER VARYING(12) NOT NULL,
    mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN wlregistration.reg_count_notify.modified_by
     IS 'Modified by, populated by trigger using function sys_context.';
COMMENT ON COLUMN wlregistration.reg_count_notify.mod_timestamp
     IS 'Modified timestamp, populated by trigger using SYSDATE.';

