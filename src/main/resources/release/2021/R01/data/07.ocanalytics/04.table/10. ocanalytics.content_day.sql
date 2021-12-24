CREATE TABLE ocanalytics.content_day(
    cd_id CHARACTER VARYING(33) NOT NULL,
    ud_id CHARACTER VARYING(33) NOT NULL,
    cd_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    cd_type CHARACTER VARYING(50) NOT NULL,
    cd_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE
)
    PARTITION BY RANGE (cd_date)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN ocanalytics.content_day.cd_mod_timestamp
     IS 'Timestamp';

