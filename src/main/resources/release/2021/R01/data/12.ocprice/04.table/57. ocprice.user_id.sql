CREATE TABLE ocprice.user_id(
    ui_user_id CHARACTER VARYING(33) NOT NULL,
    ui_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    ui_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    ui_domain CHARACTER VARYING(15) NOT NULL,
    ui_contact_num CHARACTER VARYING(40) NOT NULL,
    ui_bill_grp CHARACTER VARYING(40) NOT NULL,
    ui_company_code CHARACTER VARYING(16) NOT NULL,
    ui_modified_by CHARACTER VARYING(12) NOT NULL,
    ui_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    ui_data_owner CHARACTER VARYING(12) NOT NULL DEFAULT 'SAP',
    ui_template_id CHARACTER VARYING(33),
    ui_template_id_type CHARACTER VARYING(18),
    ui_source_id CHARACTER VARYING(10)
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocprice.user_id
     IS 'User Id Information';
COMMENT ON COLUMN ocprice.user_id.ui_user_id
     IS 'User id.';
COMMENT ON COLUMN ocprice.user_id.ui_eff_date
     IS 'Effective date.';
COMMENT ON COLUMN ocprice.user_id.ui_end_date
     IS 'End date.';
COMMENT ON COLUMN ocprice.user_id.ui_contact_num
     IS 'Contact number.';
COMMENT ON COLUMN ocprice.user_id.ui_bill_grp
     IS 'Billing group.';
COMMENT ON COLUMN ocprice.user_id.ui_company_code
     IS 'Company code.';
COMMENT ON COLUMN ocprice.user_id.ui_modified_by
     IS 'Modified by.';
COMMENT ON COLUMN ocprice.user_id.ui_mod_timestamp
     IS 'Modified timestamp.';

