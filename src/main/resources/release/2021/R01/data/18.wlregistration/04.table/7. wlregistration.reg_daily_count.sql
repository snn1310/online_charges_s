CREATE TABLE wlregistration.reg_daily_count(
    daily_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    promotion_id CHARACTER VARYING(5) NOT NULL,
    daily_count BIGINT,
    modified_by CHARACTER VARYING(12) NOT NULL,
    mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN wlregistration.reg_daily_count.modified_by
     IS 'Modified by, populated by trigger using function sys_context.';
COMMENT ON COLUMN wlregistration.reg_daily_count.mod_timestamp
     IS 'Modified timestamp, populated by trigger using SYSDATE.';

