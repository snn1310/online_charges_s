CREATE TABLE ocprice.onl_service_type(
    ost_onl_serv_type CHARACTER VARYING(4) NOT NULL,
    ost_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    ost_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    ost_domain CHARACTER VARYING(15) NOT NULL,
    ost_prc_serv_type CHARACTER VARYING(3) NOT NULL,
    ost_company_code CHARACTER VARYING(4) NOT NULL,
    ost_modified_by CHARACTER VARYING(12) NOT NULL,
    ost_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocprice.onl_service_type
     IS 'Online Service Type Information';
COMMENT ON COLUMN ocprice.onl_service_type.ost_onl_serv_type
     IS 'Online service type.';
COMMENT ON COLUMN ocprice.onl_service_type.ost_eff_date
     IS 'Effective date.';
COMMENT ON COLUMN ocprice.onl_service_type.ost_end_date
     IS 'End date.';
COMMENT ON COLUMN ocprice.onl_service_type.ost_prc_serv_type
     IS 'Pricing service type.';
COMMENT ON COLUMN ocprice.onl_service_type.ost_company_code
     IS 'Company code.';
COMMENT ON COLUMN ocprice.onl_service_type.ost_modified_by
     IS 'Modified by.';
COMMENT ON COLUMN ocprice.onl_service_type.ost_mod_timestamp
     IS 'Modified timestamp.';

