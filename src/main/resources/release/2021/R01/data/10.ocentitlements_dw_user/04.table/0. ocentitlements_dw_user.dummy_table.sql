CREATE TABLE ocentitlements_dw_user.dummy_table(
    psg_id CHARACTER VARYING(33) NOT NULL,
    ep_profile_id BIGINT NOT NULL,
    psg_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    psg_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    empid CHARACTER VARYING(30)
)
        WITH (
        OIDS=FALSE
        );

