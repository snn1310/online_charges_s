CREATE TABLE ocanalytics.onl_serv_type_group(
    ostg_group_id CHARACTER VARYING(4) NOT NULL,
    ostg_group_description CHARACTER VARYING(40) NOT NULL,
    ostg_modified_by CHARACTER VARYING(12) NOT NULL,
    ostg_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );

