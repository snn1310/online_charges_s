CREATE TABLE wlregistration.customer_contact(
    contact_id CHARACTER VARYING(33) NOT NULL,
    promotion_id CHARACTER VARYING(5),
    first_name CHARACTER VARYING(35),
    last_name CHARACTER VARYING(35),
    address1 CHARACTER VARYING(35),
    address2 CHARACTER VARYING(35),
    city CHARACTER VARYING(40),
    state CHARACTER VARYING(2),
    zip_code CHARACTER VARYING(5),
    email CHARACTER VARYING(50),
    phone CHARACTER VARYING(25),
    num_attorneys SMALLINT,
    jurisdiction CHARACTER VARYING(15),
    practitioner_type CHARACTER VARYING(15),
    employer_type CHARACTER VARYING(15),
    cust_account CHARACTER VARYING(10),
    insert_date TIMESTAMP(0) WITHOUT TIME ZONE,
    incentive_user_num INTEGER,
    modified_by CHARACTER VARYING(12) NOT NULL,
    mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN wlregistration.customer_contact.modified_by
     IS 'Modified by, populated by trigger using function sys_context.';
COMMENT ON COLUMN wlregistration.customer_contact.mod_timestamp
     IS 'Modified timestamp, populated by trigger using SYSDATE.';

