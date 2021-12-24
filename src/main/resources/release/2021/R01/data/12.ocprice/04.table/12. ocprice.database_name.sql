CREATE TABLE ocprice.database_name(
    dn_domain CHARACTER VARYING(15) NOT NULL,
    dn_database_name CHARACTER VARYING(18) NOT NULL,
    dn_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    dn_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    dn_vendor_code CHARACTER VARYING(3) NOT NULL,
    dn_waiv_inelg_ind CHARACTER(1) NOT NULL,
    dn_general_ind CHARACTER(1) NOT NULL,
    dn_db_mat_num CHARACTER VARYING(18) NOT NULL,
    dn_company_code CHARACTER VARYING(4) NOT NULL,
    dn_modified_by CHARACTER VARYING(12) NOT NULL,
    dn_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    dn_price_display_code CHARACTER VARYING(3),
    dn_category CHARACTER VARYING(2)
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocprice.database_name
     IS 'Database Name Information';
COMMENT ON COLUMN ocprice.database_name.dn_database_name
     IS 'Database name.';
COMMENT ON COLUMN ocprice.database_name.dn_eff_date
     IS 'Effective date.';
COMMENT ON COLUMN ocprice.database_name.dn_end_date
     IS 'End date.';
COMMENT ON COLUMN ocprice.database_name.dn_vendor_code
     IS 'Vendor code.';
COMMENT ON COLUMN ocprice.database_name.dn_waiv_inelg_ind
     IS 'Waiver ineligible indicator.';
COMMENT ON COLUMN ocprice.database_name.dn_general_ind
     IS 'General database indicator.';
COMMENT ON COLUMN ocprice.database_name.dn_db_mat_num
     IS 'Database material number.';
COMMENT ON COLUMN ocprice.database_name.dn_company_code
     IS 'Company code.';
COMMENT ON COLUMN ocprice.database_name.dn_modified_by
     IS 'Modified by.';
COMMENT ON COLUMN ocprice.database_name.dn_mod_timestamp
     IS 'Modified timestamp.';
COMMENT ON COLUMN ocprice.database_name.dn_price_display_code
     IS 'Indicates the type of price that should be displayed to users.';
COMMENT ON COLUMN ocprice.database_name.dn_category
     IS 'Level one of product hierarchy.';

