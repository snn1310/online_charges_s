CREATE TABLE ccdetail1.session_detail(
    ssd_id CHARACTER VARYING(33) NOT NULL,
    ssd_session_start_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    ssd_user_id CHARACTER VARYING(33) NOT NULL,
    ssd_session_id CHARACTER VARYING(33) NOT NULL,
    ssd_domain CHARACTER VARYING(15) NOT NULL,
    ssd_session_type CHARACTER(1) NOT NULL,
    ssd_start_time TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    ssd_end_time TIMESTAMP(6) WITHOUT TIME ZONE,
    ssd_seconds INTEGER NOT NULL,
    ssd_comp_code CHARACTER(1) NOT NULL,
    ssd_software_type CHARACTER VARYING(2) NOT NULL,
    ssd_software_ver CHARACTER VARYING(4) NOT NULL,
    ssd_meter_code CHARACTER(1) NOT NULL,
    ssd_onl_serv_type CHARACTER VARYING(4) NOT NULL,
    ssd_billing_option CHARACTER(1) NOT NULL,
    ssd_platform_code CHARACTER VARYING(4),
    ssd_net_orig_addr CHARACTER VARYING(14),
    ssd_net_dest_addr CHARACTER VARYING(14),
    ssd_net_trunk_name CHARACTER VARYING(8),
    ssd_net_speed CHARACTER VARYING(7),
    ssd_front_end_proc CHARACTER VARYING(4),
    ssd_onl_session_id CHARACTER VARYING(33),
    ssd_dest_code CHARACTER VARYING(3),
    ssd_print_bill_opt CHARACTER(1),
    ssd_print_copy_cnt SMALLINT NOT NULL,
    ssd_onl_session_bill_opt CHARACTER(1)
)
    PARTITION BY RANGE (ssd_session_start_date)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ccdetail1.session_detail
     IS 'Session Detail';
COMMENT ON COLUMN ccdetail1.session_detail.ssd_id
     IS 'Generated id.';
COMMENT ON COLUMN ccdetail1.session_detail.ssd_session_start_date
     IS 'Session start date, used for partitioning.';
COMMENT ON COLUMN ccdetail1.session_detail.ssd_user_id
     IS 'User id.';
COMMENT ON COLUMN ccdetail1.session_detail.ssd_session_id
     IS 'Unique session id.';
COMMENT ON COLUMN ccdetail1.session_detail.ssd_domain
     IS 'Domain';
COMMENT ON COLUMN ccdetail1.session_detail.ssd_session_type
     IS 'Session type.';
COMMENT ON COLUMN ccdetail1.session_detail.ssd_start_time
     IS 'Session start time.';
COMMENT ON COLUMN ccdetail1.session_detail.ssd_end_time
     IS 'Session end time.';
COMMENT ON COLUMN ccdetail1.session_detail.ssd_seconds
     IS 'Seconds.';
COMMENT ON COLUMN ccdetail1.session_detail.ssd_comp_code
     IS 'Session completion code.';
COMMENT ON COLUMN ccdetail1.session_detail.ssd_software_type
     IS 'Software type.';
COMMENT ON COLUMN ccdetail1.session_detail.ssd_software_ver
     IS 'Software version.';
COMMENT ON COLUMN ccdetail1.session_detail.ssd_meter_code
     IS 'Meter code.';
COMMENT ON COLUMN ccdetail1.session_detail.ssd_onl_serv_type
     IS 'Service type.';
COMMENT ON COLUMN ccdetail1.session_detail.ssd_billing_option
     IS 'Billing option.';
COMMENT ON COLUMN ccdetail1.session_detail.ssd_platform_code
     IS 'Platform code.';
COMMENT ON COLUMN ccdetail1.session_detail.ssd_net_orig_addr
     IS 'Network origination address.';
COMMENT ON COLUMN ccdetail1.session_detail.ssd_net_dest_addr
     IS 'Network destination address.';
COMMENT ON COLUMN ccdetail1.session_detail.ssd_net_trunk_name
     IS 'Network trunk name.';
COMMENT ON COLUMN ccdetail1.session_detail.ssd_net_speed
     IS 'Network speed.';
COMMENT ON COLUMN ccdetail1.session_detail.ssd_front_end_proc
     IS 'Front end process.';
COMMENT ON COLUMN ccdetail1.session_detail.ssd_onl_session_id
     IS 'Online session id initiating a print delivery session.';
COMMENT ON COLUMN ccdetail1.session_detail.ssd_dest_code
     IS 'Destination code for print delivery sessions.';
COMMENT ON COLUMN ccdetail1.session_detail.ssd_print_bill_opt
     IS 'The print-specific billing option for transactions in a print session.';
COMMENT ON COLUMN ccdetail1.session_detail.ssd_print_copy_cnt
     IS 'The number of copies for each print transaction in the print session.';

