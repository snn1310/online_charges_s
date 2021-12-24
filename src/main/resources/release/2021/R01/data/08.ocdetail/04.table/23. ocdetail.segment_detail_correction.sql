CREATE TABLE ocdetail.segment_detail_correction(
    sdc_id CHARACTER VARYING(33) NOT NULL,
    ssd_id CHARACTER VARYING(33) NOT NULL,
    sdc_session_start_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    sdc_database_name CHARACTER VARYING(18) NOT NULL,
    sdc_start_time TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    sdc_end_time TIMESTAMP(6) WITHOUT TIME ZONE,
    sdc_seconds INTEGER NOT NULL,
    sdc_comp_code CHARACTER(1) NOT NULL,
    sdc_client_id_text CHARACTER VARYING(35) NOT NULL,
    sdc_meter_code CHARACTER(1) NOT NULL,
    sdc_access_method CHARACTER VARYING(3),
    sdc_find_type CHARACTER VARYING(2),
    sdc_udm_ind CHARACTER(1),
    sdc_udm_id CHARACTER VARYING(33),
    sdc_doc_origin CHARACTER VARYING(3),
    sdc_doc_type CHARACTER VARYING(6),
    sdc_com_ov_flag CHARACTER(1),
    sdc_ct_ov_flag CHARACTER(1),
    sdc_db_ov_flag CHARACTER(1),
    sdc_price_code CHARACTER VARYING(4),
    sdc_tier_ind CHARACTER(1) NOT NULL,
    sdc_tier_id CHARACTER VARYING(33),
    sdc_tier_code CHARACTER VARYING(3),
    sdc_trail_code CHARACTER(1),
    sdc_folder_code CHARACTER(1),
    sdc_research_description CHARACTER VARYING(250),
    sdc_research_reason_code CHARACTER VARYING(36),
    sdc_billable_ind CHARACTER(1),
    sdc_practice_area CHARACTER VARYING(36),
    sdc_trackable_code CHARACTER(1),
    sdc_capped_client_id CHARACTER VARYING(35),
    sdc_capped_billable_ind CHARACTER(1),
    sdc_cap_ind CHARACTER(1)
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocdetail.segment_detail_correction
     IS 'Segment Detail';
COMMENT ON COLUMN ocdetail.segment_detail_correction.ssd_id
     IS 'SESSION_DETAIL id.';
COMMENT ON COLUMN ocdetail.segment_detail_correction.sdc_capped_client_id
     IS 'Capped client id.';
COMMENT ON COLUMN ocdetail.segment_detail_correction.sdc_capped_billable_ind
     IS 'Capped billable indicator.';
COMMENT ON COLUMN ocdetail.segment_detail_correction.sdc_cap_ind
     IS 'Cap indicator.';

