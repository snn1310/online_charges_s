CREATE TABLE ocanalytics.jurisdiction_day(
    jd_id CHARACTER VARYING(33) NOT NULL,
    ud_id CHARACTER VARYING(33) NOT NULL,
    jd_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    jd_name CHARACTER VARYING(50) NOT NULL,
    jd_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE
)
    PARTITION BY RANGE (jd_date)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN ocanalytics.jurisdiction_day.jd_mod_timestamp
     IS 'Timestamp';

