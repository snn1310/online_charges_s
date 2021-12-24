CREATE TABLE ocsumm1.customer(
    c_id CHARACTER VARYING(33) NOT NULL,
    c_company_id CHARACTER VARYING(18) NOT NULL,
    c_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    c_user_id CHARACTER VARYING(33) NOT NULL,
    c_contact_num CHARACTER VARYING(10) NOT NULL,
    c_bill_grp CHARACTER VARYING(10) NOT NULL,
    c_pay_grp CHARACTER VARYING(10) NOT NULL,
    c_org_partner CHARACTER VARYING(10) NOT NULL,
    c_mat_price_grp CHARACTER VARYING(2) NOT NULL,
    c_juris_code CHARACTER VARYING(9),
    c_tax_class CHARACTER(1) NOT NULL,
    c_country_code CHARACTER VARYING(3) NOT NULL,
    c_vat_reg_num CHARACTER VARYING(25) NOT NULL,
    c_user_id_data_owner CHARACTER VARYING(12) NOT NULL DEFAULT 'SAP',
    c_city CHARACTER VARYING(35),
    c_state CHARACTER VARYING(3),
    c_postal_code CHARACTER VARYING(10)
)
    PARTITION BY RANGE (c_date)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocsumm1.customer
     IS 'Customer';
COMMENT ON COLUMN ocsumm1.customer.c_id
     IS 'Generated id';
COMMENT ON COLUMN ocsumm1.customer.c_company_id
     IS 'Company id.';
COMMENT ON COLUMN ocsumm1.customer.c_date
     IS 'Usage date.';
COMMENT ON COLUMN ocsumm1.customer.c_user_id
     IS 'User id.';
COMMENT ON COLUMN ocsumm1.customer.c_contact_num
     IS 'Contact number';
COMMENT ON COLUMN ocsumm1.customer.c_bill_grp
     IS 'Billing group';
COMMENT ON COLUMN ocsumm1.customer.c_pay_grp
     IS 'Payment group';
COMMENT ON COLUMN ocsumm1.customer.c_org_partner
     IS 'Org partner';
COMMENT ON COLUMN ocsumm1.customer.c_mat_price_grp
     IS 'Material price group';
COMMENT ON COLUMN ocsumm1.customer.c_juris_code
     IS 'Jurisdiction code';
COMMENT ON COLUMN ocsumm1.customer.c_tax_class
     IS 'Tax class';
COMMENT ON COLUMN ocsumm1.customer.c_country_code
     IS 'Country code';
COMMENT ON COLUMN ocsumm1.customer.c_vat_reg_num
     IS 'VAT registration number';
COMMENT ON COLUMN ocsumm1.customer.c_city
     IS 'City';
COMMENT ON COLUMN ocsumm1.customer.c_state
     IS 'State';
COMMENT ON COLUMN ocsumm1.customer.c_postal_code
     IS 'Postal Code';

