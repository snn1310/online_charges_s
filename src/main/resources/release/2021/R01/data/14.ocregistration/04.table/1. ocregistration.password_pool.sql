CREATE TABLE ocregistration.password_pool(
    pp_guid CHARACTER VARYING(33) NOT NULL,
    pm_domain CHARACTER VARYING(15) NOT NULL,
    pp_prism_domain CHARACTER VARYING(15) NOT NULL,
    pm_company_code CHARACTER VARYING(4) NOT NULL,
    pm_promotion_id BIGINT NOT NULL,
    pp_user_id CHARACTER VARYING(124) NOT NULL,
    pp_password CHARACTER VARYING(50) NOT NULL,
    pp_contact_num CHARACTER VARYING(10) NOT NULL,
    pp_pool_insert_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    pp_assigned_date TIMESTAMP(0) WITHOUT TIME ZONE,
    pp_password_eff_date TIMESTAMP(0) WITHOUT TIME ZONE,
    pp_password_end_date TIMESTAMP(0) WITHOUT TIME ZONE,
    pp_modified_by CHARACTER VARYING(12) NOT NULL,
    pp_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );

