CREATE TABLE ocprice.contact(
    c_contact_num CHARACTER VARYING(10) NOT NULL,
    c_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    c_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    c_first_name CHARACTER VARYING(35),
    c_last_name CHARACTER VARYING(35),
    c_email_address CHARACTER VARYING(241),
    c_type_code CHARACTER VARYING(4) NOT NULL,
    c_modified_by CHARACTER VARYING(12) NOT NULL,
    c_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    c_graduation_date TIMESTAMP(0) WITHOUT TIME ZONE,
    c_data_owner CHARACTER VARYING(12) NOT NULL DEFAULT 'SAP',
    c_phone_num CHARACTER VARYING(16),
    c_summer_assoc_year SMALLINT,
    c_acad_status CHARACTER VARYING(2)
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ocprice.contact
     IS 'Contact information for users of online systems.';
COMMENT ON COLUMN ocprice.contact.c_contact_num
     IS 'Unique identifier for a contact.';
COMMENT ON COLUMN ocprice.contact.c_eff_date
     IS 'Date this contact starts to be active.';
COMMENT ON COLUMN ocprice.contact.c_end_date
     IS 'Date this contact ceases to be active.';
COMMENT ON COLUMN ocprice.contact.c_first_name
     IS 'First name of this contact.';
COMMENT ON COLUMN ocprice.contact.c_last_name
     IS 'Last name of this contact.';
COMMENT ON COLUMN ocprice.contact.c_email_address
     IS 'Email address of this contact.';
COMMENT ON COLUMN ocprice.contact.c_type_code
     IS 'Contact type (a.k.a. Department) code.';
COMMENT ON COLUMN ocprice.contact.c_modified_by
     IS 'Name of the person who last updated this contact.';
COMMENT ON COLUMN ocprice.contact.c_mod_timestamp
     IS 'Date and time this contact was last updated.';
COMMENT ON COLUMN ocprice.contact.c_phone_num
     IS 'Contact phone number.';
COMMENT ON COLUMN ocprice.contact.c_summer_assoc_year
     IS 'Summer associate year.';
COMMENT ON COLUMN ocprice.contact.c_acad_status
     IS 'Academic Status Code.';

