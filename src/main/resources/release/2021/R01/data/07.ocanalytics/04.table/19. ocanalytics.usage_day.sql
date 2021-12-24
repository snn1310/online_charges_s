CREATE TABLE ocanalytics.usage_day(
    ud_id CHARACTER VARYING(33) NOT NULL,
    ud_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    ud_org_partner CHARACTER VARYING(10) NOT NULL,
    ud_bill_grp CHARACTER VARYING(10) NOT NULL,
    ud_contact_num CHARACTER VARYING(10) NOT NULL,
    ud_client_id_text CHARACTER VARYING(35) NOT NULL,
    ud_usage_type CHARACTER VARYING(2) NOT NULL,
    ud_onl_serv_type CHARACTER VARYING(4) NOT NULL,
    ud_product_group CHARACTER VARYING(4) NOT NULL,
    ud_incl_excl_ind CHARACTER(1) NOT NULL,
    ud_billable_ind CHARACTER(1),
    ud_practice_area CHARACTER VARYING(36),
    ud_content_ind CHARACTER(1) NOT NULL,
    ud_jurisdiction_ind CHARACTER(1) NOT NULL,
    ud_currency_code CHARACTER VARYING(5) NOT NULL,
    ud_usage_quantity BIGINT NOT NULL,
    ud_regov_chrg_cur NUMERIC(15,2) NOT NULL,
    ud_regov_chrg_usd NUMERIC(15,2) NOT NULL,
    ud_act_chrg_cur NUMERIC(15,2) NOT NULL,
    ud_act_chrg_usd NUMERIC(15,2) NOT NULL,
    ud_sdef_chrg_cur NUMERIC(15,2) NOT NULL,
    ud_week_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL DEFAULT '01-JAN-2099',
    ud_visible_code CHARACTER VARYING(3) NOT NULL DEFAULT 'SAU',
    ud_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE
)
    PARTITION BY RANGE (ud_date)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN ocanalytics.usage_day.ud_mod_timestamp
     IS 'Timestamp';

