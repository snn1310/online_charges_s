CREATE TABLE ocsumm2.session_detail(
    sd_id CHARACTER VARYING(33) NOT NULL,
    c_id CHARACTER VARYING(33) NOT NULL,
    sd_domain CHARACTER VARYING(15) NOT NULL,
    sd_company_id CHARACTER VARYING(4) NOT NULL,
    sd_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    sd_session_id CHARACTER VARYING(33) NOT NULL,
    sd_session_type CHARACTER(1) NOT NULL,
    sd_start_time TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    sd_end_time TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    sd_seconds INTEGER NOT NULL,
    sd_comp_code CHARACTER(1) NOT NULL,
    sd_software_type CHARACTER VARYING(2) NOT NULL,
    sd_software_ver CHARACTER VARYING(4) NOT NULL,
    sd_meter_code CHARACTER(1) NOT NULL,
    sd_onl_serv_type CHARACTER VARYING(4) NOT NULL,
    sd_billing_option CHARACTER(1) NOT NULL,
    sd_platform_code CHARACTER VARYING(4),
    sd_net_orig_addr CHARACTER VARYING(14),
    sd_net_dest_addr CHARACTER VARYING(14),
    sd_net_trunk_name CHARACTER VARYING(8),
    sd_net_speed CHARACTER VARYING(7),
    sd_front_end_proc CHARACTER VARYING(4),
    sd_onl_session_id CHARACTER VARYING(33),
    sd_dest_code CHARACTER VARYING(3)
)
    PARTITION BY RANGE (sd_end_date)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocsumm2.session_detail
     IS 'Session Detail';
COMMENT ON COLUMN ocsumm2.session_detail.sd_id
     IS 'Generated id.';
COMMENT ON COLUMN ocsumm2.session_detail.c_id
     IS 'Generated id to link to customer table.';
COMMENT ON COLUMN ocsumm2.session_detail.sd_domain
     IS 'Domain';
COMMENT ON COLUMN ocsumm2.session_detail.sd_company_id
     IS 'Company id';
COMMENT ON COLUMN ocsumm2.session_detail.sd_end_date
     IS 'session end date';
COMMENT ON COLUMN ocsumm2.session_detail.sd_session_id
     IS 'Session id';
COMMENT ON COLUMN ocsumm2.session_detail.sd_session_type
     IS 'Session type';
COMMENT ON COLUMN ocsumm2.session_detail.sd_start_time
     IS 'Start time';
COMMENT ON COLUMN ocsumm2.session_detail.sd_end_time
     IS 'End time';
COMMENT ON COLUMN ocsumm2.session_detail.sd_seconds
     IS 'Seconds';
COMMENT ON COLUMN ocsumm2.session_detail.sd_comp_code
     IS 'Completion code';
COMMENT ON COLUMN ocsumm2.session_detail.sd_software_type
     IS 'Software type';
COMMENT ON COLUMN ocsumm2.session_detail.sd_software_ver
     IS 'Software version';
COMMENT ON COLUMN ocsumm2.session_detail.sd_meter_code
     IS 'Meter code';
COMMENT ON COLUMN ocsumm2.session_detail.sd_onl_serv_type
     IS 'Online service type';
COMMENT ON COLUMN ocsumm2.session_detail.sd_billing_option
     IS 'Billing option';
COMMENT ON COLUMN ocsumm2.session_detail.sd_platform_code
     IS 'Platform code';
COMMENT ON COLUMN ocsumm2.session_detail.sd_net_orig_addr
     IS 'Network origination address';
COMMENT ON COLUMN ocsumm2.session_detail.sd_net_dest_addr
     IS 'Network destination address';
COMMENT ON COLUMN ocsumm2.session_detail.sd_net_trunk_name
     IS 'Network trunk name';
COMMENT ON COLUMN ocsumm2.session_detail.sd_net_speed
     IS 'Network speed';
COMMENT ON COLUMN ocsumm2.session_detail.sd_front_end_proc
     IS 'Front end process';
COMMENT ON COLUMN ocsumm2.session_detail.sd_onl_session_id
     IS 'Online session id';
COMMENT ON COLUMN ocsumm2.session_detail.sd_dest_code
     IS 'Destination code';

