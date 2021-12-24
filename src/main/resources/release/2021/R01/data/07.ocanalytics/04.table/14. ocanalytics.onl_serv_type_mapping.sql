CREATE TABLE ocanalytics.onl_serv_type_mapping(
    ostm_onl_serv_type CHARACTER VARYING(12) NOT NULL,
    ostm_group_id CHARACTER VARYING(4) NOT NULL,
    ostm_modified_by CHARACTER VARYING(12) NOT NULL,
    ostm_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    ostm_domain CHARACTER VARYING(15)
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN ocanalytics.onl_serv_type_mapping.ostm_domain
     IS 'Service type domain';

