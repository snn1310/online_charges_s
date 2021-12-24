CREATE TABLE ocentitlements.ea_entitlement(
    entitlement_table_id CHARACTER VARYING(33) NOT NULL,
    entitlement_group_table_id CHARACTER VARYING(33) NOT NULL,
    contact_table_id CHARACTER VARYING(33) NOT NULL,
    prism_user_guid CHARACTER VARYING(33) NOT NULL,
    prism_domain CHARACTER VARYING(15) NOT NULL,
    effective_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    modified_by CHARACTER VARYING(12) NOT NULL,
    en_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL DEFAULT aws_oracle_ext.systimestamp()
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN ocentitlements.ea_entitlement.entitlement_table_id
     IS 'Database generated counter.';
COMMENT ON COLUMN ocentitlements.ea_entitlement.entitlement_group_table_id
     IS 'FK to Entitlement Group table.  One Entitlement Group to one or more Entitlement Users.';
COMMENT ON COLUMN ocentitlements.ea_entitlement.contact_table_id
     IS 'FK to Contact table.  One Contact to one or more Entitlement Users.';
COMMENT ON COLUMN ocentitlements.ea_entitlement.prism_user_guid
     IS 'Prism user GUID for the entitled user.';
COMMENT ON COLUMN ocentitlements.ea_entitlement.prism_domain
     IS 'Prism domain for the entitled user.';
COMMENT ON COLUMN ocentitlements.ea_entitlement.effective_date
     IS 'Date the users entitlement is effective.  Must be the current or future date.';
COMMENT ON COLUMN ocentitlements.ea_entitlement.end_date
     IS 'Date the users entitlement ends.  Must be greater than or equal to the entitlement effective date.  If no end date is provided, we will default with 12-31-9999.';
COMMENT ON COLUMN ocentitlements.ea_entitlement.modified_by
     IS 'Represents the requestor.  Expected to be a valid Thomson Reuters user id.';
COMMENT ON COLUMN ocentitlements.ea_entitlement.en_mod_timestamp
     IS 'Insert time on creation of updating of data. Database generated.';

