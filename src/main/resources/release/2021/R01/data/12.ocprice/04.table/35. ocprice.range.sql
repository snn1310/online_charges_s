CREATE TABLE ocprice.range(
    r_range_type CHARACTER VARYING(30) NOT NULL,
    r_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    r_start_value BIGINT NOT NULL,
    r_last_used_value BIGINT NOT NULL,
    r_max_value BIGINT NOT NULL,
    r_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    r_modified_by CHARACTER VARYING(12) NOT NULL,
    r_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );

