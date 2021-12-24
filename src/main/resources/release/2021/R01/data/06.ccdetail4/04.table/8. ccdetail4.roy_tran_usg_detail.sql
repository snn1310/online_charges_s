CREATE TABLE ccdetail4.roy_tran_usg_detail(
    rtud_id CHARACTER VARYING(33) NOT NULL,
    rtu_id CHARACTER VARYING(33) NOT NULL,
    rtud_session_start_date TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    rtud_royalty_id CHARACTER VARYING(18) NOT NULL,
    rtud_doc_cnt INTEGER NOT NULL,
    rtud_from_tu_id CHARACTER VARYING(33)
)
    PARTITION BY RANGE (rtud_session_start_date)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ccdetail4.roy_tran_usg_detail
     IS 'Royalty Transaction Usage Detail';
COMMENT ON COLUMN ccdetail4.roy_tran_usg_detail.rtud_id
     IS 'Generated id.';
COMMENT ON COLUMN ccdetail4.roy_tran_usg_detail.rtu_id
     IS 'Generated id from royalty_tran_usage';
COMMENT ON COLUMN ccdetail4.roy_tran_usg_detail.rtud_session_start_date
     IS 'Session start date, used for partitions.';
COMMENT ON COLUMN ccdetail4.roy_tran_usg_detail.rtud_royalty_id
     IS 'Royalty id.';
COMMENT ON COLUMN ccdetail4.roy_tran_usg_detail.rtud_doc_cnt
     IS 'Print reporting document count.';
COMMENT ON COLUMN ccdetail4.roy_tran_usg_detail.rtud_from_tu_id
     IS 'Transaction usage id.';

