CREATE TABLE ocprice.content_detail(
    c_domain CHARACTER VARYING(15) NOT NULL,
    cd_content_det_id CHARACTER VARYING(33) NOT NULL,
    c_content_id CHARACTER VARYING(33) NOT NULL,
    cd_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    cd_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    cd_incl_excl_ind CHARACTER(1) NOT NULL,
    cd_priority_ind CHARACTER(1) NOT NULL,
    cd_prc_serv_type CHARACTER VARYING(3),
    cd_usage_type CHARACTER VARYING(2),
    cd_access_method CHARACTER VARYING(3),
    cd_sub_usg_type CHARACTER VARYING(18),
    cd_con_com_usage CHARACTER(1),
    cd_cls_mat_num CHARACTER VARYING(18),
    cd_vendor_code CHARACTER VARYING(3),
    cd_grp_mat_num CHARACTER VARYING(18),
    cd_general_usage CHARACTER(1),
    cd_incl_excl_usage CHARACTER(1),
    cd_company_code CHARACTER VARYING(4) NOT NULL,
    cd_modified_by CHARACTER VARYING(12) NOT NULL,
    cd_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocprice.content_detail
     IS 'Content Detail Information';
COMMENT ON COLUMN ocprice.content_detail.cd_content_det_id
     IS 'Generated id for CONTENT_DETAIL.';
COMMENT ON COLUMN ocprice.content_detail.c_content_id
     IS 'Generated ID for CONTENT.';
COMMENT ON COLUMN ocprice.content_detail.cd_eff_date
     IS 'Effective date.';
COMMENT ON COLUMN ocprice.content_detail.cd_end_date
     IS 'End date.';
COMMENT ON COLUMN ocprice.content_detail.cd_incl_excl_ind
     IS 'Include or exclude indicator.';
COMMENT ON COLUMN ocprice.content_detail.cd_priority_ind
     IS 'Priority indicator of include or exclude.';
COMMENT ON COLUMN ocprice.content_detail.cd_prc_serv_type
     IS 'Pricing service type.';
COMMENT ON COLUMN ocprice.content_detail.cd_usage_type
     IS 'Usage type.';
COMMENT ON COLUMN ocprice.content_detail.cd_access_method
     IS 'The access method that applies to this content detail.';
COMMENT ON COLUMN ocprice.content_detail.cd_sub_usg_type
     IS 'Sub usagae type.';
COMMENT ON COLUMN ocprice.content_detail.cd_con_com_usage
     IS 'Include connect and communication usage.  Only valid for database time usage type.';
COMMENT ON COLUMN ocprice.content_detail.cd_cls_mat_num
     IS 'Class material number.';
COMMENT ON COLUMN ocprice.content_detail.cd_vendor_code
     IS 'Vendor code.';
COMMENT ON COLUMN ocprice.content_detail.cd_grp_mat_num
     IS 'Database group material number.';
COMMENT ON COLUMN ocprice.content_detail.cd_general_usage
     IS 'General usage flag.';
COMMENT ON COLUMN ocprice.content_detail.cd_incl_excl_usage
     IS 'Included or excluded usage flag.  Only allowed for subscriber defined and incentive pricing.';
COMMENT ON COLUMN ocprice.content_detail.cd_modified_by
     IS 'Modified by.';
COMMENT ON COLUMN ocprice.content_detail.cd_mod_timestamp
     IS 'Modified timestamp.';

