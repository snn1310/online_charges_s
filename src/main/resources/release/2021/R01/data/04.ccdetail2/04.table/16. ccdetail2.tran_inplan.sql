CREATE TABLE ccdetail2.tran_inplan(
    tri_id CHARACTER VARYING(33) NOT NULL,
    tu_id CHARACTER VARYING(33) NOT NULL,
    tri_session_start_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    tri_database_name CHARACTER VARYING(18) NOT NULL,
    tri_pricing_type CHARACTER VARYING(3),
    tri_pricing_num CHARACTER VARYING(18),
    tri_access_method CHARACTER VARYING(3)
)
    PARTITION BY RANGE (tri_session_start_date)
        WITH (
        OIDS=FALSE
        );

