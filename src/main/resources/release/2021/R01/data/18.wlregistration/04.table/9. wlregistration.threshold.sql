CREATE TABLE wlregistration.threshold(
    pt_pwd_type CHARACTER VARYING(2) NOT NULL,
    pt_company_code CHARACTER VARYING(4) NOT NULL,
    t_min_threshold INTEGER NOT NULL,
    t_last_notify TIMESTAMP(0) WITHOUT TIME ZONE,
    t_modified_by CHARACTER VARYING(12) NOT NULL,
    t_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN wlregistration.threshold.t_modified_by
     IS 'Modified by, populated by trigger using function sys_context.';
COMMENT ON COLUMN wlregistration.threshold.t_mod_timestamp
     IS 'Modified timestamp, populated by trigger using SYSDATE.';

