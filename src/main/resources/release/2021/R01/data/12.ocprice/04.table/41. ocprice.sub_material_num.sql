CREATE TABLE ocprice.sub_material_num(
    c_domain CHARACTER VARYING(15) NOT NULL,
    smn_sub_mat_num CHARACTER VARYING(18) NOT NULL,
    c_content_id CHARACTER VARYING(33) NOT NULL,
    smn_level_code CHARACTER VARYING(18) NOT NULL,
    smn_level_value CHARACTER VARYING(33) NOT NULL,
    smn_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    smn_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    smn_mat_num_type CHARACTER VARYING(3) NOT NULL,
    smn_sub_document CHARACTER VARYING(10),
    smn_line_item CHARACTER VARYING(6),
    smn_score SMALLINT,
    smn_company_code CHARACTER VARYING(4) NOT NULL,
    smn_modified_by CHARACTER VARYING(12) NOT NULL,
    smn_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocprice.sub_material_num
     IS 'Subscription Material Number Information';
COMMENT ON COLUMN ocprice.sub_material_num.smn_sub_mat_num
     IS 'Subscription material number.';
COMMENT ON COLUMN ocprice.sub_material_num.c_content_id
     IS 'Content id.';
COMMENT ON COLUMN ocprice.sub_material_num.smn_level_code
     IS 'Level code.';
COMMENT ON COLUMN ocprice.sub_material_num.smn_level_value
     IS 'Level value.';
COMMENT ON COLUMN ocprice.sub_material_num.smn_eff_date
     IS 'Effective date.';
COMMENT ON COLUMN ocprice.sub_material_num.smn_end_date
     IS 'End date.';
COMMENT ON COLUMN ocprice.sub_material_num.smn_mat_num_type
     IS 'Subscription material number type.';
COMMENT ON COLUMN ocprice.sub_material_num.smn_sub_document
     IS 'Subscription document (not required)';
COMMENT ON COLUMN ocprice.sub_material_num.smn_line_item
     IS 'Line item (not required).';
COMMENT ON COLUMN ocprice.sub_material_num.smn_score
     IS 'Rank the records for usage application.';
COMMENT ON COLUMN ocprice.sub_material_num.smn_modified_by
     IS 'Modified by.';
COMMENT ON COLUMN ocprice.sub_material_num.smn_mod_timestamp
     IS 'Modified timestamp.';

