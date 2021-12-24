CREATE TABLE ocanalytics.schema_version(
    sv_schema_version INTEGER NOT NULL,
    sv_changed TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    sv_comments CHARACTER VARYING(4000),
    sv_schema_version_sid CHARACTER VARYING(33) NOT NULL,
    sv_change_type CHARACTER VARYING(25),
    sv_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN ocanalytics.schema_version.sv_mod_timestamp
     IS 'Timestamp';

