CREATE TABLE ocprice.override(
    c_domain CHARACTER VARYING(15) NOT NULL,
    o_level_code CHARACTER VARYING(18) NOT NULL,
    o_level_value CHARACTER VARYING(33) NOT NULL,
    c_content_id CHARACTER VARYING(33) NOT NULL,
    o_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    o_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    o_override_desc CHARACTER VARYING(40) NOT NULL,
    o_override_type CHARACTER VARYING(3) NOT NULL,
    o_percent NUMERIC(7,6),
    o_rate NUMERIC(26,18),
    o_disp_rate NUMERIC(12,4),
    o_disp_rate_unit CHARACTER VARYING(3),
    o_currency_code CHARACTER VARYING(5),
    o_company_code CHARACTER VARYING(4) NOT NULL,
    o_modified_by CHARACTER VARYING(12) NOT NULL,
    o_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocprice.override
     IS 'Override Information';
COMMENT ON COLUMN ocprice.override.o_level_code
     IS 'Level code.';
COMMENT ON COLUMN ocprice.override.o_level_value
     IS 'Level value.';
COMMENT ON COLUMN ocprice.override.c_content_id
     IS 'Generated ID for CONTENT.';
COMMENT ON COLUMN ocprice.override.o_eff_date
     IS 'Effective date.';
COMMENT ON COLUMN ocprice.override.o_end_date
     IS 'End date.';
COMMENT ON COLUMN ocprice.override.o_override_desc
     IS 'Override description.';
COMMENT ON COLUMN ocprice.override.o_override_type
     IS 'Override type.';
COMMENT ON COLUMN ocprice.override.o_percent
     IS 'Override percent.';
COMMENT ON COLUMN ocprice.override.o_rate
     IS 'Override rate. DATA_PRECISION is changed from 22 to 26.';
COMMENT ON COLUMN ocprice.override.o_disp_rate
     IS 'Display rate. DATA_PRECISION is changed from 8 to 12.';
COMMENT ON COLUMN ocprice.override.o_disp_rate_unit
     IS 'Display rate unit of measure.';
COMMENT ON COLUMN ocprice.override.o_currency_code
     IS 'Rate currency code.';
COMMENT ON COLUMN ocprice.override.o_modified_by
     IS 'Modified by.';
COMMENT ON COLUMN ocprice.override.o_mod_timestamp
     IS 'Modified timestamp.';

