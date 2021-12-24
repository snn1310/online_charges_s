CREATE TABLE ocprice.usage_type(
    ut_domain CHARACTER VARYING(15) NOT NULL,
    ut_usage_type_name CHARACTER VARYING(18) NOT NULL,
    ut_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    ut_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    ut_usage_type CHARACTER VARYING(2) NOT NULL,
    ut_usg_type_label CHARACTER VARYING(10) NOT NULL,
    ut_usg_type_desc CHARACTER VARYING(40) NOT NULL,
    ut_sut_name CHARACTER VARYING(18) NOT NULL,
    ut_time_rate_ind CHARACTER(1) NOT NULL,
    ut_company_code CHARACTER VARYING(4) NOT NULL,
    ut_modified_by CHARACTER VARYING(12) NOT NULL,
    ut_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocprice.usage_type
     IS 'Usage Type Information.';
COMMENT ON COLUMN ocprice.usage_type.ut_usage_type_name
     IS 'Online Charges usage type name.';
COMMENT ON COLUMN ocprice.usage_type.ut_eff_date
     IS 'Effective date.';
COMMENT ON COLUMN ocprice.usage_type.ut_end_date
     IS 'End date.';
COMMENT ON COLUMN ocprice.usage_type.ut_usage_type
     IS 'Pricing usage type (media lower level).';
COMMENT ON COLUMN ocprice.usage_type.ut_usg_type_label
     IS 'Usage type label (short description).';
COMMENT ON COLUMN ocprice.usage_type.ut_usg_type_desc
     IS 'Usage type description.';
COMMENT ON COLUMN ocprice.usage_type.ut_sut_name
     IS 'Sub usage type name.';
COMMENT ON COLUMN ocprice.usage_type.ut_time_rate_ind
     IS 'Time rate indicator.';
COMMENT ON COLUMN ocprice.usage_type.ut_company_code
     IS 'Company code.';
COMMENT ON COLUMN ocprice.usage_type.ut_modified_by
     IS 'Modified by (e.g. business system user name, pricing formating process name).';
COMMENT ON COLUMN ocprice.usage_type.ut_mod_timestamp
     IS 'Modified timestamp.';

