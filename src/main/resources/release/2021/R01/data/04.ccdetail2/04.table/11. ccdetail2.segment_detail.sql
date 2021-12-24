CREATE TABLE ccdetail2.segment_detail(
    sgd_id CHARACTER VARYING(33) NOT NULL,
    ssd_id CHARACTER VARYING(33) NOT NULL,
    sgd_session_start_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    sgd_database_name CHARACTER VARYING(18) NOT NULL,
    sgd_start_time TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    sgd_end_time TIMESTAMP(6) WITHOUT TIME ZONE,
    sgd_seconds INTEGER NOT NULL,
    sgd_comp_code CHARACTER(1) NOT NULL,
    sgd_client_id_text CHARACTER VARYING(35) NOT NULL,
    sgd_meter_code CHARACTER(1) NOT NULL,
    sgd_access_method CHARACTER VARYING(3),
    sgd_find_type CHARACTER VARYING(2),
    sgd_udm_ind CHARACTER(1),
    sgd_udm_id CHARACTER VARYING(33),
    sgd_doc_origin CHARACTER VARYING(3),
    sgd_doc_type CHARACTER VARYING(6),
    sgd_com_ov_flag CHARACTER(1),
    sgd_ct_ov_flag CHARACTER(1),
    sgd_db_ov_flag CHARACTER(1),
    sgd_price_code CHARACTER VARYING(4),
    sgd_tier_ind CHARACTER(1) NOT NULL,
    sgd_tier_id CHARACTER VARYING(33),
    sgd_tier_code CHARACTER VARYING(3),
    sgd_trail_code CHARACTER(1),
    sgd_folder_code CHARACTER(1),
    sgd_research_description CHARACTER VARYING(250),
    sgd_research_reason_code CHARACTER VARYING(36),
    sgd_billable_ind CHARACTER(1),
    sgd_practice_area CHARACTER VARYING(36),
    sgd_trackable_code CHARACTER(1),
    sgd_capped_client_id CHARACTER VARYING(35),
    sgd_capped_billable_ind CHARACTER(1),
    sgd_cap_ind CHARACTER(1)
)
    PARTITION BY RANGE (sgd_session_start_date)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ccdetail2.segment_detail
     IS 'Segment Detail';
COMMENT ON COLUMN ccdetail2.segment_detail.sgd_id
     IS 'Generated id.';
COMMENT ON COLUMN ccdetail2.segment_detail.ssd_id
     IS 'SESSION_DETAIL id.';
COMMENT ON COLUMN ccdetail2.segment_detail.sgd_session_start_date
     IS 'Session start date, used for partitioning.';
COMMENT ON COLUMN ccdetail2.segment_detail.sgd_database_name
     IS 'Database name.';
COMMENT ON COLUMN ccdetail2.segment_detail.sgd_start_time
     IS 'Segment start time.';
COMMENT ON COLUMN ccdetail2.segment_detail.sgd_end_time
     IS 'Segment end time.';
COMMENT ON COLUMN ccdetail2.segment_detail.sgd_seconds
     IS 'Segment elapsed seconds count.';
COMMENT ON COLUMN ccdetail2.segment_detail.sgd_comp_code
     IS 'Segment Detail status code.';
COMMENT ON COLUMN ccdetail2.segment_detail.sgd_client_id_text
     IS 'Client id text.';
COMMENT ON COLUMN ccdetail2.segment_detail.sgd_meter_code
     IS 'Meter code.';
COMMENT ON COLUMN ccdetail2.segment_detail.sgd_access_method
     IS 'Access method.';
COMMENT ON COLUMN ccdetail2.segment_detail.sgd_find_type
     IS 'Find type.';
COMMENT ON COLUMN ccdetail2.segment_detail.sgd_udm_ind
     IS 'User defined multibase indicator.';
COMMENT ON COLUMN ccdetail2.segment_detail.sgd_udm_id
     IS 'User defined multibase id.';
COMMENT ON COLUMN ccdetail2.segment_detail.sgd_doc_origin
     IS 'Document origin.';
COMMENT ON COLUMN ccdetail2.segment_detail.sgd_doc_type
     IS 'Document type.';
COMMENT ON COLUMN ccdetail2.segment_detail.sgd_com_ov_flag
     IS 'Communication override flag.';
COMMENT ON COLUMN ccdetail2.segment_detail.sgd_ct_ov_flag
     IS 'sgd_ct_ov_flag';
COMMENT ON COLUMN ccdetail2.segment_detail.sgd_db_ov_flag
     IS 'Database override flag.';
COMMENT ON COLUMN ccdetail2.segment_detail.sgd_price_code
     IS 'Price code.';
COMMENT ON COLUMN ccdetail2.segment_detail.sgd_tier_ind
     IS 'Indicates if a tier applies to this usage.';
COMMENT ON COLUMN ccdetail2.segment_detail.sgd_tier_id
     IS 'Links this usage to other usage in this tier.';
COMMENT ON COLUMN ccdetail2.segment_detail.sgd_tier_code
     IS 'What type of tier this usage is.';
COMMENT ON COLUMN ccdetail2.segment_detail.sgd_trail_code
     IS 'Trail code logged by the application for each segment.';
COMMENT ON COLUMN ccdetail2.segment_detail.sgd_capped_client_id
     IS 'Capped client id.';
COMMENT ON COLUMN ccdetail2.segment_detail.sgd_capped_billable_ind
     IS 'Capped billable indicator.';
COMMENT ON COLUMN ccdetail2.segment_detail.sgd_cap_ind
     IS 'Cap indicator.';

