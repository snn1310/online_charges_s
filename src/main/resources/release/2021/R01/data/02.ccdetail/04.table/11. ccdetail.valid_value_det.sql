CREATE TABLE ccdetail.valid_value_det(
    vvd_valid_value CHARACTER VARYING(18) NOT NULL,
    vvd_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    vvd_value_rule CHARACTER VARYING(18) NOT NULL,
    vvd_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    vvd_value_desc CHARACTER VARYING(40) NOT NULL,
    vvd_modified_by CHARACTER VARYING(12) NOT NULL,
    vvd_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ccdetail.valid_value_det
     IS 'Detail Database Valid Value';
COMMENT ON COLUMN ccdetail.valid_value_det.vvd_valid_value
     IS 'Valid value.';
COMMENT ON COLUMN ccdetail.valid_value_det.vvd_eff_date
     IS 'Effective date.';
COMMENT ON COLUMN ccdetail.valid_value_det.vvd_value_rule
     IS 'Valid value rule.';
COMMENT ON COLUMN ccdetail.valid_value_det.vvd_end_date
     IS 'End date.';
COMMENT ON COLUMN ccdetail.valid_value_det.vvd_value_desc
     IS 'Valid value description.';
COMMENT ON COLUMN ccdetail.valid_value_det.vvd_modified_by
     IS 'Modified by.';
COMMENT ON COLUMN ccdetail.valid_value_det.vvd_mod_timestamp
     IS 'Modified timestamp.';

