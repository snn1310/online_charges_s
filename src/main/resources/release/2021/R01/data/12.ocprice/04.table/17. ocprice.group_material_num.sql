CREATE TABLE ocprice.group_material_num(
    gmn_grp_mat_num CHARACTER VARYING(18) NOT NULL,
    gmn_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    gmn_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    gmn_domain CHARACTER VARYING(15) NOT NULL,
    gmn_price_code CHARACTER VARYING(4) NOT NULL,
    gmn_company_code CHARACTER VARYING(4) NOT NULL,
    gmn_modified_by CHARACTER VARYING(12) NOT NULL,
    gmn_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocprice.group_material_num
     IS 'Database Group Material Number Information';
COMMENT ON COLUMN ocprice.group_material_num.gmn_grp_mat_num
     IS 'Database group material number.';
COMMENT ON COLUMN ocprice.group_material_num.gmn_eff_date
     IS 'Effective date.';
COMMENT ON COLUMN ocprice.group_material_num.gmn_end_date
     IS 'End date.';
COMMENT ON COLUMN ocprice.group_material_num.gmn_price_code
     IS 'Fixed price code.';
COMMENT ON COLUMN ocprice.group_material_num.gmn_company_code
     IS 'Company code.';
COMMENT ON COLUMN ocprice.group_material_num.gmn_modified_by
     IS 'Modified by.';
COMMENT ON COLUMN ocprice.group_material_num.gmn_mod_timestamp
     IS 'Modified timestamp.';

