CREATE TABLE ocprice.material_rate(
    mr_cls_mat_num CHARACTER VARYING(18) NOT NULL,
    mpg_mat_prc_grp CHARACTER VARYING(2) NOT NULL,
    mr_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    mr_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    mr_domain CHARACTER VARYING(15) NOT NULL,
    mr_currency_code CHARACTER VARYING(5) NOT NULL,
    mr_rate NUMERIC(26,18) NOT NULL,
    mr_disp_rate NUMERIC(11,3) NOT NULL,
    mr_disp_rate_unit CHARACTER VARYING(3) NOT NULL,
    mr_company_code CHARACTER VARYING(4) NOT NULL,
    mr_modified_by CHARACTER VARYING(12) NOT NULL,
    mr_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocprice.material_rate
     IS 'Class Material Rate Information';
COMMENT ON COLUMN ocprice.material_rate.mr_cls_mat_num
     IS 'Price class material number.';
COMMENT ON COLUMN ocprice.material_rate.mpg_mat_prc_grp
     IS 'Material price group.';
COMMENT ON COLUMN ocprice.material_rate.mr_eff_date
     IS 'Effective date.';
COMMENT ON COLUMN ocprice.material_rate.mr_end_date
     IS 'End date.';
COMMENT ON COLUMN ocprice.material_rate.mr_currency_code
     IS 'Currency code.';
COMMENT ON COLUMN ocprice.material_rate.mr_rate
     IS 'Material rate per lowest unit of measure (e.g. per second for time). DATA_PRECISION is changed from 24 to 26.';
COMMENT ON COLUMN ocprice.material_rate.mr_disp_rate
     IS 'Display rate. DATA_PRECISION is changed from 9 to 11.';
COMMENT ON COLUMN ocprice.material_rate.mr_disp_rate_unit
     IS 'Display rate unit of measure.';
COMMENT ON COLUMN ocprice.material_rate.mr_modified_by
     IS 'Modified by.';
COMMENT ON COLUMN ocprice.material_rate.mr_mod_timestamp
     IS 'Modified timestamp.';

