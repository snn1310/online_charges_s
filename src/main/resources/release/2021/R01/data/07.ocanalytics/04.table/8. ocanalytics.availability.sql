CREATE TABLE ocanalytics.availability(
    a_info_code CHARACTER VARYING(18) NOT NULL,
    a_domain CHARACTER VARYING(15) NOT NULL,
    a_begin_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    a_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    a_modified_by CHARACTER VARYING(12) NOT NULL,
    a_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );

