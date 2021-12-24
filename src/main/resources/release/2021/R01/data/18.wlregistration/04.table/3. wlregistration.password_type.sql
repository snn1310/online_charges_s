CREATE TABLE wlregistration.password_type(
    pt_pwd_type CHARACTER VARYING(2) NOT NULL,
    pt_company_code CHARACTER VARYING(4) NOT NULL,
    pt_pwd_type_desc CHARACTER VARYING(40) NOT NULL,
    pt_modified_by CHARACTER VARYING(12) NOT NULL,
    pt_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN wlregistration.password_type.pt_modified_by
     IS 'Modified by, populated by trigger using function sys_context.';
COMMENT ON COLUMN wlregistration.password_type.pt_mod_timestamp
     IS 'Modified timestamp, populated by trigger using SYSDATE.';

