CREATE TABLE ocsumm.daily_total(
    dt_company_id CHARACTER VARYING(4) NOT NULL,
    dt_usage_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    dt_domain CHARACTER VARYING(15) NOT NULL,
    dt_table_name CHARACTER VARYING(18) NOT NULL,
    dt_usage_type CHARACTER VARYING(2) NOT NULL,
    dt_incl_excl_ind CHARACTER(1) NOT NULL,
    dt_record_cnt BIGINT NOT NULL,
    dt_usage_cnt BIGINT NOT NULL,
    dt_chrg_usage_cnt BIGINT NOT NULL,
    dt_free_usage_cnt BIGINT NOT NULL,
    dt_regov_chrg_usd NUMERIC(15,2) NOT NULL,
    dt_act_chrg_usd NUMERIC(15,2) NOT NULL,
    dt_modified_by CHARACTER VARYING(12) NOT NULL,
    dt_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocsumm.daily_total
     IS 'Daily Totals';
COMMENT ON COLUMN ocsumm.daily_total.dt_company_id
     IS 'Company id';
COMMENT ON COLUMN ocsumm.daily_total.dt_usage_date
     IS 'Usage date';
COMMENT ON COLUMN ocsumm.daily_total.dt_domain
     IS 'Domain';
COMMENT ON COLUMN ocsumm.daily_total.dt_table_name
     IS 'Table name';
COMMENT ON COLUMN ocsumm.daily_total.dt_usage_type
     IS 'Usage type';
COMMENT ON COLUMN ocsumm.daily_total.dt_incl_excl_ind
     IS 'Include Exclude Indicator';
COMMENT ON COLUMN ocsumm.daily_total.dt_record_cnt
     IS 'Record Count';
COMMENT ON COLUMN ocsumm.daily_total.dt_usage_cnt
     IS 'Usage Count';
COMMENT ON COLUMN ocsumm.daily_total.dt_chrg_usage_cnt
     IS 'Chargeable Usage Count';
COMMENT ON COLUMN ocsumm.daily_total.dt_free_usage_cnt
     IS 'Free Usage Count';
COMMENT ON COLUMN ocsumm.daily_total.dt_regov_chrg_usd
     IS 'Regular override charge USD';
COMMENT ON COLUMN ocsumm.daily_total.dt_act_chrg_usd
     IS 'Actual charge USD';
COMMENT ON COLUMN ocsumm.daily_total.dt_modified_by
     IS 'Modified By';
COMMENT ON COLUMN ocsumm.daily_total.dt_mod_timestamp
     IS 'Modified Timestamp';

