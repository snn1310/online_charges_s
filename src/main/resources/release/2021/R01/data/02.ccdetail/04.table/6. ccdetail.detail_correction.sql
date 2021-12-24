CREATE TABLE ccdetail.detail_correction(
    dc_id CHARACTER VARYING(33) NOT NULL,
    dc_version INTEGER NOT NULL,
    dc_transaction_id CHARACTER VARYING(33) NOT NULL,
    dc_correction_type CHARACTER VARYING(15) NOT NULL,
    dc_original_data_id CHARACTER VARYING(33),
    dc_corrected_data_id CHARACTER VARYING(33),
    dc_session_id CHARACTER VARYING(33) NOT NULL,
    dc_usage_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    dc_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    dc_modified_by CHARACTER VARYING(12) NOT NULL,
    dc_editor_name CHARACTER VARYING(100)
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN ccdetail.detail_correction.dc_editor_name
     IS 'Editor Name';

