CREATE TABLE ocprice.sub_usage_type(
    sut_domain CHARACTER VARYING(15) NOT NULL,
    sut_sut_name CHARACTER VARYING(18) NOT NULL,
    sut_sub_usg_type CHARACTER VARYING(18) NOT NULL,
    sut_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    sut_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    sut_sut_label CHARACTER VARYING(10) NOT NULL,
    sut_sut_desc CHARACTER VARYING(40) NOT NULL,
    sut_company_code CHARACTER VARYING(4) NOT NULL,
    sut_modified_by CHARACTER VARYING(12) NOT NULL,
    sut_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocprice.sub_usage_type
     IS 'Sub Usage Type Information';
COMMENT ON COLUMN ocprice.sub_usage_type.sut_sut_name
     IS 'Sub usage type name.';
COMMENT ON COLUMN ocprice.sub_usage_type.sut_sub_usg_type
     IS 'Sub usage type.';
COMMENT ON COLUMN ocprice.sub_usage_type.sut_eff_date
     IS 'Effective date.';
COMMENT ON COLUMN ocprice.sub_usage_type.sut_end_date
     IS 'End date.';
COMMENT ON COLUMN ocprice.sub_usage_type.sut_sut_label
     IS 'Sub usage type valid value label (short description).';
COMMENT ON COLUMN ocprice.sub_usage_type.sut_sut_desc
     IS 'Sub usage type valid value description.';
COMMENT ON COLUMN ocprice.sub_usage_type.sut_company_code
     IS 'Company code.';
COMMENT ON COLUMN ocprice.sub_usage_type.sut_modified_by
     IS 'Modified by.';
COMMENT ON COLUMN ocprice.sub_usage_type.sut_mod_timestamp
     IS 'Modified timestamp.';

