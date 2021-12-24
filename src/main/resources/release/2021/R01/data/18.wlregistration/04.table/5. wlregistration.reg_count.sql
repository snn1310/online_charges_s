CREATE TABLE wlregistration.reg_count(
    count_id CHARACTER VARYING(16) NOT NULL,
    promotion_id CHARACTER VARYING(5) NOT NULL,
    total_count BIGINT,
    total_max BIGINT,
    daily_max BIGINT,
    next_threshold BIGINT,
    interval BIGINT,
    modified_by CHARACTER VARYING(12) NOT NULL,
    mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN wlregistration.reg_count.modified_by
     IS 'Modified by, populated by trigger using function sys_context.';
COMMENT ON COLUMN wlregistration.reg_count.mod_timestamp
     IS 'Modified timestamp, populated by trigger using SYSDATE.';

