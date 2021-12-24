CREATE TABLE ccdetail3.time_inplan(
    tii_id CHARACTER VARYING(33) NOT NULL,
    sgd_id CHARACTER VARYING(33) NOT NULL,
    tii_session_start_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    tii_database_name CHARACTER VARYING(18) NOT NULL,
    tii_pricing_type CHARACTER VARYING(3),
    tii_pricing_num CHARACTER VARYING(18),
    tii_access_method CHARACTER VARYING(3)
)
    PARTITION BY RANGE (tii_session_start_date)
        WITH (
        OIDS=FALSE
        );

