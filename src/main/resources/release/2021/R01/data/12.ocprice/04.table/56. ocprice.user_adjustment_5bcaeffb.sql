CREATE TABLE ocprice.user_adjustment_5bcaeffb(
    ua_sub_mat_num CHARACTER VARYING(18) NOT NULL,
    ua_domain CHARACTER VARYING(15) NOT NULL,
    ua_adjust_type CHARACTER VARYING(18) NOT NULL,
    ua_adjust_value CHARACTER VARYING(50) NOT NULL,
    ua_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    ua_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    ua_action CHARACTER VARYING(10) NOT NULL,
    ua_modified_by CHARACTER VARYING(12) NOT NULL,
    ua_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );

