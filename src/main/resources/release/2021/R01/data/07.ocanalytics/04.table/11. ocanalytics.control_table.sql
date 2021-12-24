CREATE TABLE ocanalytics.control_table(
    ct_id CHARACTER VARYING(33) NOT NULL,
    ct_domain CHARACTER VARYING(15) NOT NULL,
    ct_target CHARACTER VARYING(18) NOT NULL,
    ct_source CHARACTER VARYING(18) NOT NULL,
    ct_status CHARACTER VARYING(18) NOT NULL,
    ct_start_time TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    ct_end_time TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    ct_usage_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    ct_restart_id CHARACTER VARYING(33),
    ct_modified_by CHARACTER VARYING(12) NOT NULL,
    ct_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );

