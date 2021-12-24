CREATE TABLE ocentitlements.ea_external_entitlement(
    external_entitlement_table_id CHARACTER VARYING(33) NOT NULL,
    contact_table_id CHARACTER VARYING(33) NOT NULL,
    prism_user_guid CHARACTER VARYING(33) NOT NULL,
    prism_domain CHARACTER VARYING(15) NOT NULL,
    modified_by CHARACTER VARYING(12) NOT NULL,
    ee_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL DEFAULT aws_oracle_ext.systimestamp()
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN ocentitlements.ea_external_entitlement.external_entitlement_table_id
     IS 'Database generated counter.';
COMMENT ON COLUMN ocentitlements.ea_external_entitlement.contact_table_id
     IS 'FK to Contact table.  One Contact to one or more External Entitlement Users.';
COMMENT ON COLUMN ocentitlements.ea_external_entitlement.prism_user_guid
     IS 'Prism user GUID for the externally entitled user. ';
COMMENT ON COLUMN ocentitlements.ea_external_entitlement.prism_domain
     IS 'Prism domain for the externally entitled user.';
COMMENT ON COLUMN ocentitlements.ea_external_entitlement.modified_by
     IS 'Represents the requestor.  Expected to be a valid Thomson Reuters user id.';
COMMENT ON COLUMN ocentitlements.ea_external_entitlement.ee_mod_timestamp
     IS 'Insert time on creation of updating of data. Database generated.';

