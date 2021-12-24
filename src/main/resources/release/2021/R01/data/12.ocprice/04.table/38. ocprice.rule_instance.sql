CREATE TABLE ocprice.rule_instance(
    ri_id CHARACTER VARYING(33) NOT NULL,
    ri_rule_name CHARACTER VARYING(50) NOT NULL,
    ri_domain CHARACTER VARYING(15) NOT NULL,
    ri_description CHARACTER VARYING(1000),
    ri_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    ri_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    ri_modified_by CHARACTER VARYING(12) NOT NULL,
    ri_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );

