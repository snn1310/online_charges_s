CREATE TABLE ocprice.ebook_config(
    ec_mat_num CHARACTER VARYING(18) NOT NULL,
    ec_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    ec_company_name CHARACTER VARYING(200) NOT NULL,
    ec_user_guid CHARACTER VARYING(33) NOT NULL,
    ec_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    ec_modified_by CHARACTER VARYING(10) NOT NULL,
    ec_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );

