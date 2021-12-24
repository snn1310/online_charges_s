CREATE TABLE ocanalytics.analytics_segment_corr(
    asc_id CHARACTER VARYING(33) NOT NULL,
    as_session_id CHARACTER VARYING(33) NOT NULL,
    asc_start_time TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    asc_end_time TIMESTAMP(6) WITHOUT TIME ZONE,
    asc_elapsed_seconds INTEGER NOT NULL,
    asc_incl_excl_ind CHARACTER(1) NOT NULL,
    asc_billing_option CHARACTER(1) NOT NULL,
    asc_regov_chrg_cur NUMERIC(11,2) NOT NULL,
    asc_act_chrg_cur NUMERIC(11,2) NOT NULL,
    asc_sdef_chrg_cur NUMERIC(11,2) NOT NULL,
    asc_sdef_ind CHARACTER(1) NOT NULL,
    asc_currency_code CHARACTER VARYING(5) NOT NULL,
    asc_client_id_text CHARACTER VARYING(35) NOT NULL,
    asc_contact_num CHARACTER VARYING(10) NOT NULL,
    asc_bill_grp CHARACTER VARYING(10) NOT NULL,
    asc_billable_ind CHARACTER(1),
    asc_research_description CHARACTER VARYING(250),
    asc_research_reason_code CHARACTER VARYING(36),
    asc_practice_area CHARACTER VARYING(36),
    asc_onl_serv_type CHARACTER VARYING(4) NOT NULL,
    asc_database_name CHARACTER VARYING(18) NOT NULL,
    asc_usage_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    asc_sgd_id CHARACTER VARYING(33) NOT NULL,
    asc_billing_detail_id CHARACTER VARYING(33) NOT NULL,
    asc_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE,
    asc_capped_client_id CHARACTER VARYING(35),
    asc_cap_ind CHARACTER(1),
    asc_reduction_ind CHARACTER(1),
    asc_reduction_amt NUMERIC(11,2)
)
    PARTITION BY RANGE (asc_usage_date)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN ocanalytics.analytics_segment_corr.asc_id
     IS 'Generated id';
COMMENT ON COLUMN ocanalytics.analytics_segment_corr.as_session_id
     IS 'Billing session id';
COMMENT ON COLUMN ocanalytics.analytics_segment_corr.asc_start_time
     IS 'Start time of session';
COMMENT ON COLUMN ocanalytics.analytics_segment_corr.asc_end_time
     IS 'End time of session';
COMMENT ON COLUMN ocanalytics.analytics_segment_corr.asc_elapsed_seconds
     IS 'Elapsed seconds';
COMMENT ON COLUMN ocanalytics.analytics_segment_corr.asc_incl_excl_ind
     IS 'Include exclude indicator';
COMMENT ON COLUMN ocanalytics.analytics_segment_corr.asc_billing_option
     IS 'Billing option';
COMMENT ON COLUMN ocanalytics.analytics_segment_corr.asc_regov_chrg_cur
     IS 'Regular/override charge in customer currency';
COMMENT ON COLUMN ocanalytics.analytics_segment_corr.asc_act_chrg_cur
     IS 'Actual charge in customer currency';
COMMENT ON COLUMN ocanalytics.analytics_segment_corr.asc_sdef_chrg_cur
     IS 'Subscriber defined charge in customer currency';
COMMENT ON COLUMN ocanalytics.analytics_segment_corr.asc_sdef_ind
     IS 'Subscriber defined indicator';
COMMENT ON COLUMN ocanalytics.analytics_segment_corr.asc_currency_code
     IS 'Customer currency code';
COMMENT ON COLUMN ocanalytics.analytics_segment_corr.asc_client_id_text
     IS 'Client id text';
COMMENT ON COLUMN ocanalytics.analytics_segment_corr.asc_contact_num
     IS 'Contact number';
COMMENT ON COLUMN ocanalytics.analytics_segment_corr.asc_bill_grp
     IS 'Billing group';
COMMENT ON COLUMN ocanalytics.analytics_segment_corr.asc_billable_ind
     IS 'Billable indicator';
COMMENT ON COLUMN ocanalytics.analytics_segment_corr.asc_research_description
     IS 'Research description';
COMMENT ON COLUMN ocanalytics.analytics_segment_corr.asc_research_reason_code
     IS 'Research reason code';
COMMENT ON COLUMN ocanalytics.analytics_segment_corr.asc_practice_area
     IS 'Practice area';
COMMENT ON COLUMN ocanalytics.analytics_segment_corr.asc_onl_serv_type
     IS 'Online service type';
COMMENT ON COLUMN ocanalytics.analytics_segment_corr.asc_database_name
     IS 'Database name';
COMMENT ON COLUMN ocanalytics.analytics_segment_corr.asc_usage_date
     IS 'Usage date';
COMMENT ON COLUMN ocanalytics.analytics_segment_corr.asc_sgd_id
     IS 'Generated id';
COMMENT ON COLUMN ocanalytics.analytics_segment_corr.asc_billing_detail_id
     IS 'Billing detail id';
COMMENT ON COLUMN ocanalytics.analytics_segment_corr.asc_mod_timestamp
     IS 'Timestamp';
COMMENT ON COLUMN ocanalytics.analytics_segment_corr.asc_capped_client_id
     IS 'Capped client id.';
COMMENT ON COLUMN ocanalytics.analytics_segment_corr.asc_cap_ind
     IS 'Cap indicator.';
COMMENT ON COLUMN ocanalytics.analytics_segment_corr.asc_reduction_ind
     IS 'INIDICTES SEGMENT HAS REDUCED VALUE FROM CAP';
COMMENT ON COLUMN ocanalytics.analytics_segment_corr.asc_reduction_amt
     IS 'REDUCED VALUE AMOUNT FROM CAP';

