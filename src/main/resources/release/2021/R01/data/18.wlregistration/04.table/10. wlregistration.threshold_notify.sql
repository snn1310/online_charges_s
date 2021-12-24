CREATE TABLE wlregistration.threshold_notify(
    pt_company_code CHARACTER VARYING(4) NOT NULL,
    pt_pwd_type CHARACTER VARYING(2) NOT NULL,
    tn_email CHARACTER VARYING(50) NOT NULL,
    tn_modified_by CHARACTER VARYING(12) NOT NULL,
    tn_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN wlregistration.threshold_notify.tn_modified_by
     IS 'Modified by, populated by trigger using function sys_context.';
COMMENT ON COLUMN wlregistration.threshold_notify.tn_mod_timestamp
     IS 'Modified timestamp, populated by trigger using SYSDATE.';

