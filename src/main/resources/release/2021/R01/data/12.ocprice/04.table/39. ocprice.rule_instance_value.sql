CREATE TABLE ocprice.rule_instance_value(
    ri_id CHARACTER VARYING(33) NOT NULL,
    riv_rule_name CHARACTER VARYING(50) NOT NULL,
    riv_attribute_name CHARACTER VARYING(50) NOT NULL,
    riv_value CHARACTER VARYING(250) NOT NULL,
    riv_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    riv_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    riv_request_id CHARACTER VARYING(20),
    riv_modified_by CHARACTER VARYING(12) NOT NULL,
    riv_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );

