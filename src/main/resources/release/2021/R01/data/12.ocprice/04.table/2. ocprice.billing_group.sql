CREATE TABLE ocprice.billing_group(
    bg_bill_grp CHARACTER VARYING(10) NOT NULL,
    bg_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    bg_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    bg_org_partner CHARACTER VARYING(10) NOT NULL,
    bg_pay_grp CHARACTER VARYING(10) NOT NULL,
    bg_juris_code CHARACTER VARYING(9),
    bg_country_code CHARACTER VARYING(3) NOT NULL,
    bg_vat_reg_num CHARACTER VARYING(25) NOT NULL,
    bg_tax_class CHARACTER(1) NOT NULL,
    bg_currency_code CHARACTER VARYING(5) NOT NULL,
    bg_intl_acct_ind CHARACTER(1) NOT NULL,
    bg_company_code CHARACTER VARYING(4) DEFAULT 'WEST',
    bg_modified_by CHARACTER VARYING(12) NOT NULL,
    bg_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    bg_bill_grp_name CHARACTER VARYING(35),
    bg_group_code CHARACTER VARYING(2),
    bg_industry_code CHARACTER VARYING(4),
    bg_industry_code_1 CHARACTER VARYING(10),
    bg_city CHARACTER VARYING(35),
    bg_state CHARACTER VARYING(3),
    bg_data_owner CHARACTER VARYING(12) NOT NULL DEFAULT 'SAP',
    bg_postal_code CHARACTER VARYING(10)
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocprice.billing_group
     IS 'Billing Group Information';
COMMENT ON COLUMN ocprice.billing_group.bg_bill_grp
     IS 'Billing group.';
COMMENT ON COLUMN ocprice.billing_group.bg_eff_date
     IS 'Effective date.';
COMMENT ON COLUMN ocprice.billing_group.bg_end_date
     IS 'End date.';
COMMENT ON COLUMN ocprice.billing_group.bg_org_partner
     IS 'Organization partner.';
COMMENT ON COLUMN ocprice.billing_group.bg_pay_grp
     IS 'Payment group.';
COMMENT ON COLUMN ocprice.billing_group.bg_juris_code
     IS 'Tax jurisdiction code.';
COMMENT ON COLUMN ocprice.billing_group.bg_country_code
     IS 'Country code.';
COMMENT ON COLUMN ocprice.billing_group.bg_vat_reg_num
     IS 'VAT registration number.';
COMMENT ON COLUMN ocprice.billing_group.bg_tax_class
     IS 'Customer tax class.';
COMMENT ON COLUMN ocprice.billing_group.bg_currency_code
     IS 'Billing currency code.';
COMMENT ON COLUMN ocprice.billing_group.bg_intl_acct_ind
     IS 'International account indicator (WIBS).';
COMMENT ON COLUMN ocprice.billing_group.bg_company_code
     IS 'Company code.';
COMMENT ON COLUMN ocprice.billing_group.bg_modified_by
     IS 'Modified by.';
COMMENT ON COLUMN ocprice.billing_group.bg_mod_timestamp
     IS 'Modified timestamp.';
COMMENT ON COLUMN ocprice.billing_group.bg_bill_grp_name
     IS 'Name of the billing group (ZB, Customer, Location).';
COMMENT ON COLUMN ocprice.billing_group.bg_group_code
     IS 'Customer grouping code.';
COMMENT ON COLUMN ocprice.billing_group.bg_industry_code
     IS 'Primary industry code used to group billing groups.';
COMMENT ON COLUMN ocprice.billing_group.bg_industry_code_1
     IS 'Secondary industry code used to group billing groups.';
COMMENT ON COLUMN ocprice.billing_group.bg_city
     IS 'City of the billing group address.';
COMMENT ON COLUMN ocprice.billing_group.bg_state
     IS 'State of the billing group address.';
COMMENT ON COLUMN ocprice.billing_group.bg_postal_code
     IS 'Postal Code';

