CREATE TABLE ocanalytics.analytics_correction_new(
    ac_id CHARACTER VARYING(33) NOT NULL,
    ac_version INTEGER NOT NULL,
    ac_transaction_id CHARACTER VARYING(33) NOT NULL,
    ac_correction_type CHARACTER VARYING(15) NOT NULL,
    ac_original_data_id CHARACTER VARYING(33),
    ac_corrected_data_id CHARACTER VARYING(33),
    ac_session_id CHARACTER VARYING(33) NOT NULL,
    ac_usage_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    ac_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    ac_modified_by CHARACTER VARYING(12) NOT NULL,
    ac_editor_name CHARACTER VARYING(100)
)
    PARTITION BY RANGE (ac_usage_date)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN ocanalytics.analytics_correction_new.ac_editor_name
     IS 'Editor Name';

