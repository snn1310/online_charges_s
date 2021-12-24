CREATE TABLE ccdetail1.tran_royalty(
    trr_id CHARACTER VARYING(33) NOT NULL,
    tu_id CHARACTER VARYING(33) NOT NULL,
    trr_session_start_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    trr_royalty_id CHARACTER VARYING(18) NOT NULL,
    trr_char_cnt INTEGER NOT NULL,
    trr_line_cnt INTEGER NOT NULL,
    trr_doc_cnt INTEGER NOT NULL,
    trr_royalty_data CHARACTER VARYING(80),
    trr_from_tu_id CHARACTER VARYING(33),
    trr_disp_surcharge_ind CHARACTER(1) NOT NULL
)
    PARTITION BY RANGE (trr_session_start_date)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ccdetail1.tran_royalty
     IS 'Transaction Royalty';
COMMENT ON COLUMN ccdetail1.tran_royalty.trr_id
     IS 'Generated id.';
COMMENT ON COLUMN ccdetail1.tran_royalty.tu_id
     IS 'Generated id from transaction_usage.';
COMMENT ON COLUMN ccdetail1.tran_royalty.trr_session_start_date
     IS 'Session start date, used for partitioning.';
COMMENT ON COLUMN ccdetail1.tran_royalty.trr_royalty_id
     IS 'Royalty identifier.';
COMMENT ON COLUMN ccdetail1.tran_royalty.trr_char_cnt
     IS 'Document character count.';
COMMENT ON COLUMN ccdetail1.tran_royalty.trr_line_cnt
     IS 'Line count.';
COMMENT ON COLUMN ccdetail1.tran_royalty.trr_doc_cnt
     IS 'Document count.';
COMMENT ON COLUMN ccdetail1.tran_royalty.trr_royalty_data
     IS 'Royalty data.';
COMMENT ON COLUMN ccdetail1.tran_royalty.trr_from_tu_id
     IS 'From tu id.';

