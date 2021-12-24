CREATE TABLE ocprice.rule_attribute(
    ra_rule_name CHARACTER VARYING(50) NOT NULL,
    ra_attribute_name CHARACTER VARYING(50) NOT NULL,
    ra_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    ra_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    ra_required CHARACTER(1) NOT NULL,
    ra_multivalued CHARACTER(1) NOT NULL,
    ra_type CHARACTER VARYING(10) NOT NULL,
    ra_description CHARACTER VARYING(1000),
    ra_modified_by CHARACTER VARYING(12) NOT NULL,
    ra_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );

