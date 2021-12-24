CREATE TABLE ccdetail2.time_royalty(
    tir_id CHARACTER VARYING(33) NOT NULL,
    sgd_id CHARACTER VARYING(33) NOT NULL,
    tir_session_start_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    tir_royalty_id CHARACTER VARYING(18) NOT NULL,
    tir_seconds INTEGER NOT NULL,
    tir_format_code CHARACTER VARYING(3),
    tir_start_time TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    tir_comp_code CHARACTER(1) NOT NULL,
    tir_multiplier SMALLINT NOT NULL
)
    PARTITION BY RANGE (tir_session_start_date)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ccdetail2.time_royalty
     IS 'Time Royalty';
COMMENT ON COLUMN ccdetail2.time_royalty.tir_id
     IS 'Generated id.';
COMMENT ON COLUMN ccdetail2.time_royalty.sgd_id
     IS 'Generated id.';
COMMENT ON COLUMN ccdetail2.time_royalty.tir_session_start_date
     IS 'Session start date, used for partitioning.';
COMMENT ON COLUMN ccdetail2.time_royalty.tir_royalty_id
     IS 'Royalty id.';
COMMENT ON COLUMN ccdetail2.time_royalty.tir_seconds
     IS 'Seconds';
COMMENT ON COLUMN ccdetail2.time_royalty.tir_format_code
     IS 'Format code.';
COMMENT ON COLUMN ccdetail2.time_royalty.tir_start_time
     IS 'Royalty display start time.';
COMMENT ON COLUMN ccdetail2.time_royalty.tir_comp_code
     IS 'Completion code.';
COMMENT ON COLUMN ccdetail2.time_royalty.tir_multiplier
     IS 'Time royalty multiplier.';

