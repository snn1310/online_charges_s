CREATE TABLE wlregistration.password_map(
    password_map_id CHARACTER VARYING(33) NOT NULL,
    promotion_id CHARACTER VARYING(5),
    incentive_user_num INTEGER,
    actual_user_num INTEGER,
    organization CHARACTER VARYING(10),
    location CHARACTER VARYING(10),
    contact CHARACTER VARYING(10),
    effective_date TIMESTAMP(0) WITHOUT TIME ZONE,
    end_date TIMESTAMP(0) WITHOUT TIME ZONE,
    incentive_password CHARACTER VARYING(10),
    source_system CHARACTER VARYING(5),
    created_by_user CHARACTER VARYING(10),
    promotion_num CHARACTER VARYING(10),
    modified_by CHARACTER VARYING(12) NOT NULL,
    mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN wlregistration.password_map.modified_by
     IS 'Modified by, populated by trigger using function sys_context.';
COMMENT ON COLUMN wlregistration.password_map.mod_timestamp
     IS 'Modified timestamp, populated by trigger using SYSDATE.';

