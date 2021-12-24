CREATE TABLE ocanalytics.analytics_transaction_corr(
    atc_id CHARACTER VARYING(33) NOT NULL,
    as_sgd_id CHARACTER VARYING(33) NOT NULL,
    atc_tu_id CHARACTER VARYING(33) NOT NULL,
    atc_act_chrg_cur NUMERIC(11,2) NOT NULL,
    atc_bill_grp CHARACTER VARYING(10) NOT NULL,
    atc_billing_detail_id CHARACTER VARYING(33) NOT NULL,
    atc_client_id_text CHARACTER VARYING(35) NOT NULL,
    atc_command_type CHARACTER VARYING(18),
    atc_con_type CHARACTER VARYING(50),
    atc_contact_num CHARACTER VARYING(10) NOT NULL,
    atc_database_name CHARACTER VARYING(18) NOT NULL,
    atc_dest_code CHARACTER VARYING(3),
    atc_doc_name CHARACTER VARYING(80),
    atc_incl_excl_ind CHARACTER(1) NOT NULL,
    atc_juris_name CHARACTER VARYING(50),
    atc_query_text CHARACTER VARYING(4000),
    atc_regov_chrg_cur NUMERIC(11,2) NOT NULL,
    atc_sdef_chrg_cur NUMERIC(11,2) NOT NULL,
    atc_sdef_ind CHARACTER(1) NOT NULL,
    atc_session_id CHARACTER VARYING(33) NOT NULL,
    atc_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    atc_usage_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    atc_usage_type CHARACTER VARYING(2) NOT NULL,
    atc_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE,
    atc_capped_client_id CHARACTER VARYING(35),
    atc_cap_ind CHARACTER(1)
)
    PARTITION BY RANGE (atc_usage_date)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN ocanalytics.analytics_transaction_corr.atc_id
     IS 'Generated id';
COMMENT ON COLUMN ocanalytics.analytics_transaction_corr.as_sgd_id
     IS 'Segment id in detail database';
COMMENT ON COLUMN ocanalytics.analytics_transaction_corr.atc_tu_id
     IS 'Transaction usage id';
COMMENT ON COLUMN ocanalytics.analytics_transaction_corr.atc_act_chrg_cur
     IS 'Actual charge in customer currency';
COMMENT ON COLUMN ocanalytics.analytics_transaction_corr.atc_bill_grp
     IS 'Billing group';
COMMENT ON COLUMN ocanalytics.analytics_transaction_corr.atc_billing_detail_id
     IS 'Billing detail id';
COMMENT ON COLUMN ocanalytics.analytics_transaction_corr.atc_client_id_text
     IS 'Client id text';
COMMENT ON COLUMN ocanalytics.analytics_transaction_corr.atc_command_type
     IS 'Command type for usage type P9';
COMMENT ON COLUMN ocanalytics.analytics_transaction_corr.atc_con_type
     IS 'Content type';
COMMENT ON COLUMN ocanalytics.analytics_transaction_corr.atc_contact_num
     IS 'Contact number';
COMMENT ON COLUMN ocanalytics.analytics_transaction_corr.atc_database_name
     IS 'Database name';
COMMENT ON COLUMN ocanalytics.analytics_transaction_corr.atc_dest_code
     IS 'Destination code';
COMMENT ON COLUMN ocanalytics.analytics_transaction_corr.atc_doc_name
     IS 'Document name';
COMMENT ON COLUMN ocanalytics.analytics_transaction_corr.atc_incl_excl_ind
     IS 'Include exclude indicator';
COMMENT ON COLUMN ocanalytics.analytics_transaction_corr.atc_juris_name
     IS 'Jurisdiction name';
COMMENT ON COLUMN ocanalytics.analytics_transaction_corr.atc_query_text
     IS 'Search query text';
COMMENT ON COLUMN ocanalytics.analytics_transaction_corr.atc_regov_chrg_cur
     IS 'Regular/override charge in customer currency';
COMMENT ON COLUMN ocanalytics.analytics_transaction_corr.atc_sdef_chrg_cur
     IS 'Subscriber defined charge in customer currency';
COMMENT ON COLUMN ocanalytics.analytics_transaction_corr.atc_sdef_ind
     IS 'Subscriber defined indicator';
COMMENT ON COLUMN ocanalytics.analytics_transaction_corr.atc_session_id
     IS 'Billing session id';
COMMENT ON COLUMN ocanalytics.analytics_transaction_corr.atc_timestamp
     IS 'Search transaction timestamp';
COMMENT ON COLUMN ocanalytics.analytics_transaction_corr.atc_usage_date
     IS 'Usage date';
COMMENT ON COLUMN ocanalytics.analytics_transaction_corr.atc_usage_type
     IS 'Usage type';
COMMENT ON COLUMN ocanalytics.analytics_transaction_corr.atc_mod_timestamp
     IS 'Timestamp';
COMMENT ON COLUMN ocanalytics.analytics_transaction_corr.atc_capped_client_id
     IS 'Capped client id.';
COMMENT ON COLUMN ocanalytics.analytics_transaction_corr.atc_cap_ind
     IS 'Cap indicator.';

