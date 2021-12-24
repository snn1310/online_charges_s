CREATE TABLE ocprice.material_number(
    mn_mat_num CHARACTER VARYING(18) NOT NULL,
    mn_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    mn_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    mn_domain CHARACTER VARYING(15) NOT NULL,
    mn_mat_num_desc CHARACTER VARYING(40) NOT NULL,
    mn_media_low_lvl CHARACTER VARYING(2) NOT NULL,
    mn_md_low_lvl_desc CHARACTER VARYING(40) NOT NULL,
    mn_product_code CHARACTER VARYING(14) NOT NULL,
    mn_company_code CHARACTER VARYING(4) NOT NULL,
    mn_modified_by CHARACTER VARYING(12) NOT NULL,
    mn_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    mn_material_type CHARACTER VARYING(4),
    mn_media_high_lvl CHARACTER VARYING(2),
    mn_md_high_lvl_desc CHARACTER VARYING(40)
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocprice.material_number
     IS 'Material Number Information';
COMMENT ON COLUMN ocprice.material_number.mn_mat_num
     IS 'Material number.';
COMMENT ON COLUMN ocprice.material_number.mn_eff_date
     IS 'Effective date.';
COMMENT ON COLUMN ocprice.material_number.mn_end_date
     IS 'End date.';
COMMENT ON COLUMN ocprice.material_number.mn_mat_num_desc
     IS 'Material number description.';
COMMENT ON COLUMN ocprice.material_number.mn_media_low_lvl
     IS 'Media lower level.';
COMMENT ON COLUMN ocprice.material_number.mn_md_low_lvl_desc
     IS 'Media lower level description.';
COMMENT ON COLUMN ocprice.material_number.mn_product_code
     IS 'Product code.';
COMMENT ON COLUMN ocprice.material_number.mn_company_code
     IS 'Company code.';
COMMENT ON COLUMN ocprice.material_number.mn_modified_by
     IS 'Modified by.';
COMMENT ON COLUMN ocprice.material_number.mn_mod_timestamp
     IS 'Modified timestamp.';
COMMENT ON COLUMN ocprice.material_number.mn_material_type
     IS 'Material Type.';
COMMENT ON COLUMN ocprice.material_number.mn_media_high_lvl
     IS 'Media higher level.';
COMMENT ON COLUMN ocprice.material_number.mn_md_high_lvl_desc
     IS 'Media higher level description.';

