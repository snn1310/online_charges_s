CREATE TABLE ocdetail.analytics_totals(
    at_usage_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    at_usage_type CHARACTER VARYING(2) NOT NULL,
    at_incl_excl_ind CHARACTER(1) NOT NULL,
    at_visible_code CHARACTER(3) NOT NULL,
    at_onl_serv_type CHARACTER VARYING(4) NOT NULL,
    at_record_cnt BIGINT NOT NULL,
    at_usage_cnt BIGINT NOT NULL,
    at_regov_chrg_usd NUMERIC(15,2) NOT NULL,
    at_regov_chrg_cur NUMERIC(15,2) NOT NULL,
    at_act_chrg_usd NUMERIC(15,2) NOT NULL,
    at_act_chrg_cur NUMERIC(15,2) NOT NULL,
    at_sdef_chrg_cur NUMERIC(15,2) NOT NULL,
    at_modified_by CHARACTER VARYING(12) NOT NULL,
    at_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN ocdetail.analytics_totals.at_usage_date
     IS 'Usage date';
COMMENT ON COLUMN ocdetail.analytics_totals.at_usage_type
     IS 'Usage type';
COMMENT ON COLUMN ocdetail.analytics_totals.at_incl_excl_ind
     IS 'Include Exclude indicator';
COMMENT ON COLUMN ocdetail.analytics_totals.at_visible_code
     IS 'Visible Code';
COMMENT ON COLUMN ocdetail.analytics_totals.at_onl_serv_type
     IS 'Online service type';
COMMENT ON COLUMN ocdetail.analytics_totals.at_record_cnt
     IS 'Row count';
COMMENT ON COLUMN ocdetail.analytics_totals.at_usage_cnt
     IS 'Usage quantity count.';
COMMENT ON COLUMN ocdetail.analytics_totals.at_regov_chrg_usd
     IS 'Regular override charge in USD';
COMMENT ON COLUMN ocdetail.analytics_totals.at_regov_chrg_cur
     IS 'Regular override charge in local currency';
COMMENT ON COLUMN ocdetail.analytics_totals.at_act_chrg_usd
     IS 'Actual charge in USD ';
COMMENT ON COLUMN ocdetail.analytics_totals.at_act_chrg_cur
     IS 'Actual charge in local currency';
COMMENT ON COLUMN ocdetail.analytics_totals.at_sdef_chrg_cur
     IS 'Subscriber defined charge in local currency';
COMMENT ON COLUMN ocdetail.analytics_totals.at_modified_by
     IS 'Modified by';
COMMENT ON COLUMN ocdetail.analytics_totals.at_mod_timestamp
     IS 'Modified timestamp';

