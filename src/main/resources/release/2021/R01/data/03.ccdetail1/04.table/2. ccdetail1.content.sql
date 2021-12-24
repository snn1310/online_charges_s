CREATE TABLE ccdetail1.content(
    con_id CHARACTER VARYING(33) NOT NULL,
    tu_id CHARACTER VARYING(33) NOT NULL,
    con_session_start_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    con_type CHARACTER VARYING(50) NOT NULL
)
    PARTITION BY RANGE (con_session_start_date)
        WITH (
        OIDS=FALSE
        );

