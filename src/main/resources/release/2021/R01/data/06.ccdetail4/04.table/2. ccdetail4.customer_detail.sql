CREATE TABLE ccdetail4.customer_detail(
    cd_id CHARACTER VARYING(33) NOT NULL,
    cd_session_start_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    cd_user_id CHARACTER VARYING(33) NOT NULL,
    cd_usage_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    cd_company_id CHARACTER VARYING(4) NOT NULL,
    cd_contact_num CHARACTER VARYING(10) NOT NULL,
    cd_bill_grp CHARACTER VARYING(10) NOT NULL,
    cd_pay_grp CHARACTER VARYING(10) NOT NULL,
    cd_org_partner CHARACTER VARYING(10) NOT NULL,
    cd_mat_price_grp CHARACTER VARYING(2) NOT NULL,
    cd_juris_code CHARACTER VARYING(9),
    cd_tax_class CHARACTER(1) NOT NULL,
    cd_country_code CHARACTER VARYING(3) NOT NULL,
    cd_vat_reg_num CHARACTER VARYING(25) NOT NULL,
    cd_domain CHARACTER VARYING(15),
    cd_industry_code CHARACTER VARYING(4),
    cd_group_code CHARACTER VARYING(2),
    cd_user_id_data_owner CHARACTER VARYING(12) NOT NULL DEFAULT 'SAP',
    cd_city CHARACTER VARYING(35),
    cd_state CHARACTER VARYING(3),
    cd_postal_code CHARACTER VARYING(10)
)
    PARTITION BY RANGE (cd_session_start_date)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ccdetail4.customer_detail
     IS 'Customer Detail';
COMMENT ON COLUMN ccdetail4.customer_detail.cd_id
     IS 'Generated id.';
COMMENT ON COLUMN ccdetail4.customer_detail.cd_session_start_date
     IS 'Session start date, used for partitioning.';
COMMENT ON COLUMN ccdetail4.customer_detail.cd_user_id
     IS 'User id.';
COMMENT ON COLUMN ccdetail4.customer_detail.cd_usage_date
     IS 'Usage date.';
COMMENT ON COLUMN ccdetail4.customer_detail.cd_company_id
     IS 'Company code.';
COMMENT ON COLUMN ccdetail4.customer_detail.cd_contact_num
     IS 'Contact number.';
COMMENT ON COLUMN ccdetail4.customer_detail.cd_bill_grp
     IS 'Billing group.';
COMMENT ON COLUMN ccdetail4.customer_detail.cd_pay_grp
     IS 'Payment group.';
COMMENT ON COLUMN ccdetail4.customer_detail.cd_org_partner
     IS 'Organization partner.';
COMMENT ON COLUMN ccdetail4.customer_detail.cd_mat_price_grp
     IS 'Ancillary subscription material price group.';
COMMENT ON COLUMN ccdetail4.customer_detail.cd_juris_code
     IS 'Tax jurisdiction code.';
COMMENT ON COLUMN ccdetail4.customer_detail.cd_tax_class
     IS 'Customer tax class.';
COMMENT ON COLUMN ccdetail4.customer_detail.cd_country_code
     IS 'Country code.';
COMMENT ON COLUMN ccdetail4.customer_detail.cd_vat_reg_num
     IS 'VAT registration number.';
COMMENT ON COLUMN ccdetail4.customer_detail.cd_city
     IS 'City';
COMMENT ON COLUMN ccdetail4.customer_detail.cd_state
     IS 'State';
COMMENT ON COLUMN ccdetail4.customer_detail.cd_postal_code
     IS 'Postal Code';

