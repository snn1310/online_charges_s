CREATE TABLE ocregistration.customer_contact(
    pp_guid CHARACTER VARYING(33) NOT NULL,
    cc_first_name CHARACTER VARYING(35),
    cc_last_name CHARACTER VARYING(35),
    cc_organization_name CHARACTER VARYING(200),
    cc_city CHARACTER VARYING(40),
    cc_state CHARACTER VARYING(2),
    cc_zip CHARACTER VARYING(5),
    cc_email CHARACTER VARYING(241),
    cc_phone CHARACTER VARYING(16),
    cc_customer_account CHARACTER VARYING(10),
    cc_existing_user_id CHARACTER VARYING(33),
    cc_existing_user_id_domain CHARACTER VARYING(15),
    cc_existing_org_partner CHARACTER VARYING(10),
    cc_existing_bill_grp CHARACTER VARYING(10),
    cc_existing_contact CHARACTER VARYING(10),
    cc_requesting_source CHARACTER VARYING(5),
    cc_requesting_user CHARACTER VARYING(10),
    cc_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );

