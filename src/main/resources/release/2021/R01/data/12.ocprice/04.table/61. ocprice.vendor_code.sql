CREATE TABLE ocprice.vendor_code(
    vc_domain CHARACTER VARYING(15) NOT NULL,
    vc_vendor_code CHARACTER VARYING(3) NOT NULL,
    vc_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    vc_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    vc_price_code CHARACTER VARYING(4) NOT NULL,
    vc_vendor_desc CHARACTER VARYING(40) NOT NULL,
    vc_company_code CHARACTER VARYING(4) NOT NULL,
    vc_modified_by CHARACTER VARYING(12) NOT NULL,
    vc_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocprice.vendor_code
     IS 'Vendor Code Information';
COMMENT ON COLUMN ocprice.vendor_code.vc_vendor_code
     IS 'Vendor code (SAP vendor higher level).';
COMMENT ON COLUMN ocprice.vendor_code.vc_eff_date
     IS 'Effective date.';
COMMENT ON COLUMN ocprice.vendor_code.vc_end_date
     IS 'End date.';
COMMENT ON COLUMN ocprice.vendor_code.vc_price_code
     IS 'Fixed price code.';
COMMENT ON COLUMN ocprice.vendor_code.vc_vendor_desc
     IS 'Vendor code description.';
COMMENT ON COLUMN ocprice.vendor_code.vc_company_code
     IS 'Company code.';
COMMENT ON COLUMN ocprice.vendor_code.vc_modified_by
     IS 'Modified by.';
COMMENT ON COLUMN ocprice.vendor_code.vc_mod_timestamp
     IS 'Modified timestamp.';

