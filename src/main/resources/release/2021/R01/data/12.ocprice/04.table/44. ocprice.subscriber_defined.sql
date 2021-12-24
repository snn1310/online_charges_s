CREATE TABLE ocprice.subscriber_defined(
    c_domain CHARACTER VARYING(15) NOT NULL,
    sd_level_code CHARACTER VARYING(18) NOT NULL,
    sd_level_value CHARACTER VARYING(33) NOT NULL,
    c_content_id CHARACTER VARYING(33) NOT NULL,
    sd_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    sd_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    sd_sub_def_desc CHARACTER VARYING(40) NOT NULL,
    sd_sub_def_type CHARACTER VARYING(3) NOT NULL,
    sd_percent NUMERIC(8,5),
    sd_company_code CHARACTER VARYING(4) NOT NULL,
    sd_modified_by CHARACTER VARYING(12) NOT NULL,
    sd_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    sd_rate NUMERIC(26,18),
    sd_disp_rate NUMERIC(12,4),
    sd_disp_rate_unit CHARACTER VARYING(3),
    sd_currency_code CHARACTER VARYING(5)
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocprice.subscriber_defined
     IS 'Subscriber Defined Information';
COMMENT ON COLUMN ocprice.subscriber_defined.sd_level_code
     IS 'Level code.';
COMMENT ON COLUMN ocprice.subscriber_defined.sd_level_value
     IS 'Level value.';
COMMENT ON COLUMN ocprice.subscriber_defined.c_content_id
     IS 'Generated ID for CONTENT.';
COMMENT ON COLUMN ocprice.subscriber_defined.sd_eff_date
     IS 'Effective date.';
COMMENT ON COLUMN ocprice.subscriber_defined.sd_end_date
     IS 'End date.';
COMMENT ON COLUMN ocprice.subscriber_defined.sd_sub_def_desc
     IS 'Subscriber defined description.';
COMMENT ON COLUMN ocprice.subscriber_defined.sd_sub_def_type
     IS 'Subscriber defined type.';
COMMENT ON COLUMN ocprice.subscriber_defined.sd_percent
     IS 'Percent.';
COMMENT ON COLUMN ocprice.subscriber_defined.sd_modified_by
     IS 'Modified by.';
COMMENT ON COLUMN ocprice.subscriber_defined.sd_mod_timestamp
     IS 'Modified timestamp.';
COMMENT ON COLUMN ocprice.subscriber_defined.sd_rate
     IS 'Override rate. DATA_PRECISION is changed from 22 to 26.';
COMMENT ON COLUMN ocprice.subscriber_defined.sd_disp_rate
     IS 'Display rate. DATA_PRECISION is changed from 8 to 12.';

