CREATE TABLE wlregistration.password(
    pt_pwd_type CHARACTER VARYING(2) NOT NULL,
    pt_company_code CHARACTER VARYING(4) NOT NULL,
    p_contact_num CHARACTER VARYING(10) NOT NULL,
    p_inserted TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    p_user_id CHARACTER VARYING(33) NOT NULL,
    p_password CHARACTER VARYING(10) NOT NULL,
    p_bill_grp CHARACTER VARYING(10) NOT NULL,
    p_assigned TIMESTAMP(6) WITHOUT TIME ZONE,
    p_modified_by CHARACTER VARYING(12) NOT NULL,
    p_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN wlregistration.password.p_modified_by
     IS 'Modified by, populated by trigger using function sys_context.';
COMMENT ON COLUMN wlregistration.password.p_mod_timestamp
     IS 'Modified timestamp, populated by trigger using SYSDATE.';

