CREATE TABLE wlregistration.promotion_profile(
    promotion_id CHARACTER VARYING(5) NOT NULL,
    promotion_type CHARACTER VARYING(20),
    title CHARACTER VARYING(50),
    description CHARACTER VARYING(500),
    start_date TIMESTAMP(0) WITHOUT TIME ZONE,
    end_date TIMESTAMP(0) WITHOUT TIME ZONE,
    open_date TIMESTAMP(0) WITHOUT TIME ZONE,
    close_date TIMESTAMP(0) WITHOUT TIME ZONE,
    promotion_num CHARACTER VARYING(10),
    modified_by CHARACTER VARYING(12) NOT NULL,
    mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN wlregistration.promotion_profile.modified_by
     IS 'Modified by, populated by trigger using function sys_context.';
COMMENT ON COLUMN wlregistration.promotion_profile.mod_timestamp
     IS 'Modified timestamp, populated by trigger using SYSDATE.';

