CREATE TABLE ocsumm.summary_correction(
    sc_id CHARACTER VARYING(33) NOT NULL,
    sc_version INTEGER NOT NULL,
    sc_transaction_id CHARACTER VARYING(33) NOT NULL,
    sc_correction_type CHARACTER VARYING(15) NOT NULL,
    sc_original_data_id CHARACTER VARYING(33),
    sc_corrected_data_id CHARACTER VARYING(33),
    sc_session_id CHARACTER VARYING(33) NOT NULL,
    sc_usage_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    sc_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    sc_modified_by CHARACTER VARYING(12) NOT NULL,
    sc_editor_name CHARACTER VARYING(100)
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN ocsumm.summary_correction.sc_editor_name
     IS 'Editor Name';

