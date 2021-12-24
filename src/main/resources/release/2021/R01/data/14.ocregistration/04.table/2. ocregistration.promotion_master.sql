CREATE TABLE ocregistration.promotion_master(
    pm_domain CHARACTER VARYING(15) NOT NULL,
    pm_company_code CHARACTER VARYING(4) NOT NULL,
    pm_promotion_id BIGINT NOT NULL,
    pm_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    pm_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    pm_type CHARACTER VARYING(20) NOT NULL,
    pm_title CHARACTER VARYING(50) NOT NULL,
    pm_description CHARACTER VARYING(500) NOT NULL,
    pm_account_num CHARACTER VARYING(10) NOT NULL,
    pm_active_days INTEGER NOT NULL,
    pm_password_max_total INTEGER,
    pm_password_max_daily INTEGER,
    pm_notify_frequency INTEGER,
    pm_notify_email CHARACTER VARYING(241),
    pm_pool_min_threshold INTEGER NOT NULL,
    pm_pool_notify_email CHARACTER VARYING(241) NOT NULL,
    pm_modified_by CHARACTER VARYING(12) NOT NULL,
    pm_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );

