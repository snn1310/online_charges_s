CREATE TABLE ccdetail3.jurisdiction(
    j_id CHARACTER VARYING(33) NOT NULL,
    tu_id CHARACTER VARYING(33) NOT NULL,
    j_session_start_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    j_name CHARACTER VARYING(50) NOT NULL
)
    PARTITION BY RANGE (j_session_start_date)
        WITH (
        OIDS=FALSE
        );

