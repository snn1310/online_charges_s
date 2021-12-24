CREATE TABLE ocprice.promotion_content(
    prn_promo_number CHARACTER VARYING(8) NOT NULL,
    c_content_id CHARACTER VARYING(33) NOT NULL,
    pc_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    pc_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    c_domain CHARACTER VARYING(15) NOT NULL,
    pc_modified_by CHARACTER VARYING(12) NOT NULL,
    pc_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    pc_company_code CHARACTER VARYING(4) NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN ocprice.promotion_content.prn_promo_number
     IS 'Promotion number.';
COMMENT ON COLUMN ocprice.promotion_content.c_content_id
     IS 'Content GUID - link to CONTENT table';
COMMENT ON COLUMN ocprice.promotion_content.pc_eff_date
     IS 'Promotion content effective date.';
COMMENT ON COLUMN ocprice.promotion_content.pc_end_date
     IS 'Promotion content end date.';
COMMENT ON COLUMN ocprice.promotion_content.c_domain
     IS 'Content domain.';
COMMENT ON COLUMN ocprice.promotion_content.pc_modified_by
     IS 'User or system performing modification.';
COMMENT ON COLUMN ocprice.promotion_content.pc_mod_timestamp
     IS 'Timestamp when last modified.';
COMMENT ON COLUMN ocprice.promotion_content.pc_company_code
     IS 'Company Code used to create or update.';

