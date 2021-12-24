CREATE TABLE ocanalytics.usage_day_correction_old(
    udc_id CHARACTER VARYING(33) NOT NULL,
    udc_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    udc_org_partner CHARACTER VARYING(10) NOT NULL,
    udc_bill_grp CHARACTER VARYING(10) NOT NULL,
    udc_contact_num CHARACTER VARYING(10) NOT NULL,
    udc_client_id_text CHARACTER VARYING(35) NOT NULL,
    udc_usage_type CHARACTER VARYING(2) NOT NULL,
    udc_onl_serv_type CHARACTER VARYING(4) NOT NULL,
    udc_product_group CHARACTER VARYING(4) NOT NULL,
    udc_incl_excl_ind CHARACTER(1) NOT NULL,
    udc_billable_ind CHARACTER(1),
    udc_practice_area CHARACTER VARYING(36),
    udc_content_ind CHARACTER(1) NOT NULL,
    udc_jurisdiction_ind CHARACTER(1) NOT NULL,
    udc_currency_code CHARACTER VARYING(5) NOT NULL,
    udc_usage_quantity BIGINT NOT NULL,
    udc_regov_chrg_cur NUMERIC(15,2) NOT NULL,
    udc_regov_chrg_usd NUMERIC(15,2) NOT NULL,
    udc_act_chrg_cur NUMERIC(15,2) NOT NULL,
    udc_act_chrg_usd NUMERIC(15,2) NOT NULL,
    udc_sdef_chrg_cur NUMERIC(15,2) NOT NULL,
    udc_week_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL DEFAULT '01-JAN-2099',
    udc_visible_code CHARACTER VARYING(3) NOT NULL DEFAULT 'SAU',
    udc_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN ocanalytics.usage_day_correction_old.udc_mod_timestamp
     IS 'Timestamp';

