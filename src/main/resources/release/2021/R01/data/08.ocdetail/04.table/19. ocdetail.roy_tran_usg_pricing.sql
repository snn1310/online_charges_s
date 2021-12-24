CREATE TABLE ocdetail.roy_tran_usg_pricing(
    rtup_id CHARACTER VARYING(33) NOT NULL,
    cd_id CHARACTER VARYING(33) NOT NULL,
    rtu_id CHARACTER VARYING(33) NOT NULL,
    rtup_session_start_date TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    rtup_usage_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    rtup_usage_type CHARACTER VARYING(2) NOT NULL,
    rtup_db_mat_num CHARACTER VARYING(18) NOT NULL,
    rtup_vendor_code CHARACTER VARYING(3) NOT NULL
)
    PARTITION BY RANGE (rtup_session_start_date)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocdetail.roy_tran_usg_pricing
     IS 'Royalty Transaction Usage Pricing';
COMMENT ON COLUMN ocdetail.roy_tran_usg_pricing.rtup_id
     IS 'Generated id.';
COMMENT ON COLUMN ocdetail.roy_tran_usg_pricing.cd_id
     IS 'Generated id from customer_detail';
COMMENT ON COLUMN ocdetail.roy_tran_usg_pricing.rtu_id
     IS 'Generated id from royalty_tran_usage.';
COMMENT ON COLUMN ocdetail.roy_tran_usg_pricing.rtup_session_start_date
     IS 'Session start date, used for partitions.';
COMMENT ON COLUMN ocdetail.roy_tran_usg_pricing.rtup_usage_date
     IS 'Usage date.';
COMMENT ON COLUMN ocdetail.roy_tran_usg_pricing.rtup_usage_type
     IS 'Usage type.';
COMMENT ON COLUMN ocdetail.roy_tran_usg_pricing.rtup_db_mat_num
     IS 'Database material number.';
COMMENT ON COLUMN ocdetail.roy_tran_usg_pricing.rtup_vendor_code
     IS 'Database vendor code.';

