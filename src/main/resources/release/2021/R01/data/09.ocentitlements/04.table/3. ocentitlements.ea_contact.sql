CREATE TABLE ocentitlements.ea_contact(
    contact_table_id CHARACTER VARYING(33) NOT NULL,
    contact_id CHARACTER VARYING(10) NOT NULL,
    business_system_id CHARACTER VARYING(12) NOT NULL,
    first_name CHARACTER VARYING(35) NOT NULL,
    last_name CHARACTER VARYING(35) NOT NULL,
    email_address CHARACTER VARYING(241),
    contact_type CHARACTER VARYING(4) NOT NULL,
    account_table_id CHARACTER VARYING(33) NOT NULL,
    modified_by CHARACTER VARYING(12) NOT NULL,
    ct_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL DEFAULT aws_oracle_ext.systimestamp()
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN ocentitlements.ea_contact.contact_table_id
     IS 'Database generated counter.';
COMMENT ON COLUMN ocentitlements.ea_contact.contact_id
     IS 'ID representing the contact. Calling business system defines the value, but it must be unique per Business System ID';
COMMENT ON COLUMN ocentitlements.ea_contact.business_system_id
     IS 'ID representing the business system calling the service.';
COMMENT ON COLUMN ocentitlements.ea_contact.first_name
     IS 'Contact''s first name. Dataroom uses this information';
COMMENT ON COLUMN ocentitlements.ea_contact.last_name
     IS 'Contact''s last name. Dataroom uses this information';
COMMENT ON COLUMN ocentitlements.ea_contact.email_address
     IS 'Contact''s email address.  Dataroom uses this information';
COMMENT ON COLUMN ocentitlements.ea_contact.contact_type
     IS 'Contact type. Dataroom uses this information';
COMMENT ON COLUMN ocentitlements.ea_contact.account_table_id
     IS 'FK to Account table. An account will contain 1 to many contacts.  A contact can only be part of one account.';
COMMENT ON COLUMN ocentitlements.ea_contact.modified_by
     IS 'Represents the requestor. Expected to be a valid Thomson Reuters user id.';
COMMENT ON COLUMN ocentitlements.ea_contact.ct_mod_timestamp
     IS 'Insert time on creation of updating of data. Database generated.';

