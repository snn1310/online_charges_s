CREATE TABLE ocprice.rule(
    r_rule_name CHARACTER VARYING(50) NOT NULL,
    r_description CHARACTER VARYING(1000) NOT NULL,
    r_type CHARACTER VARYING(20) NOT NULL,
    r_domain_requirement CHARACTER(1) NOT NULL,
    r_psa_section CHARACTER VARYING(30),
    r_modified_by CHARACTER VARYING(12) NOT NULL,
    r_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );

