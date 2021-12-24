CREATE TABLE ocprice.subscription(
    s_sub_document CHARACTER VARYING(10) NOT NULL,
    s_line_item CHARACTER VARYING(6) NOT NULL,
    s_level_code CHARACTER VARYING(18) NOT NULL,
    s_level_value CHARACTER VARYING(33) NOT NULL,
    s_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    s_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    s_domain CHARACTER VARYING(15) NOT NULL,
    s_sub_type CHARACTER VARYING(3) NOT NULL,
    s_sub_mat_num CHARACTER VARYING(18) NOT NULL,
    s_mat_prc_grp CHARACTER VARYING(2) NOT NULL,
    s_company_code CHARACTER VARYING(4) NOT NULL,
    s_modified_by CHARACTER VARYING(12) NOT NULL,
    s_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    s_alloc_document CHARACTER VARYING(10) NOT NULL,
    s_alloc_item CHARACTER VARYING(6) NOT NULL,
    s_storage_key CHARACTER VARYING(32),
    s_limit_amount BIGINT,
    s_limit_type CHARACTER VARYING(15),
    s_offer_id CHARACTER VARYING(33),
    s_data_owner CHARACTER VARYING(12) NOT NULL DEFAULT 'SAP',
    s_offer_channel CHARACTER VARYING(10),
    s_license_id CHARACTER VARYING(33)
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocprice.subscription
     IS 'Subscription Information';
COMMENT ON COLUMN ocprice.subscription.s_sub_document
     IS 'Subscription document.';
COMMENT ON COLUMN ocprice.subscription.s_line_item
     IS 'Line item.';
COMMENT ON COLUMN ocprice.subscription.s_level_code
     IS 'Level code.';
COMMENT ON COLUMN ocprice.subscription.s_level_value
     IS 'Level value.';
COMMENT ON COLUMN ocprice.subscription.s_eff_date
     IS 'Effective date.';
COMMENT ON COLUMN ocprice.subscription.s_end_date
     IS 'End date.';
COMMENT ON COLUMN ocprice.subscription.s_sub_type
     IS 'Subscription type.';
COMMENT ON COLUMN ocprice.subscription.s_sub_mat_num
     IS 'Subscription material number.';
COMMENT ON COLUMN ocprice.subscription.s_mat_prc_grp
     IS 'Material price group.';
COMMENT ON COLUMN ocprice.subscription.s_company_code
     IS 'Company code.';
COMMENT ON COLUMN ocprice.subscription.s_modified_by
     IS 'Modified by.';
COMMENT ON COLUMN ocprice.subscription.s_mod_timestamp
     IS 'Modified timestamp.';
COMMENT ON COLUMN ocprice.subscription.s_license_id
     IS 'License identifier';

