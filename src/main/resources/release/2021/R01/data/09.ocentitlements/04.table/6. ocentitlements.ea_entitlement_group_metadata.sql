CREATE TABLE ocentitlements.ea_entitlement_group_metadata(
    ent_group_metadata_table_id CHARACTER VARYING(33) NOT NULL,
    entitlement_group_table_id CHARACTER VARYING(33) NOT NULL,
    name CHARACTER VARYING(35) NOT NULL,
    value CHARACTER VARYING(50) NOT NULL,
    modified_by CHARACTER VARYING(12) NOT NULL,
    em_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL DEFAULT aws_oracle_ext.systimestamp()
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN ocentitlements.ea_entitlement_group_metadata.ent_group_metadata_table_id
     IS 'Database generated counter.';
COMMENT ON COLUMN ocentitlements.ea_entitlement_group_metadata.entitlement_group_table_id
     IS 'FK to Entitlement Group table.  An entitlement group will contain 1 to many entitlement group metadata records.';
COMMENT ON COLUMN ocentitlements.ea_entitlement_group_metadata.name
     IS 'Name of Metadata, what the metadata value is representing.
"STORAGE KEY"
"PRISM DOMAIN"
"REGION"
"STORAGE LIMIT"';
COMMENT ON COLUMN ocentitlements.ea_entitlement_group_metadata.value
     IS 'Value for the metadata name';
COMMENT ON COLUMN ocentitlements.ea_entitlement_group_metadata.modified_by
     IS 'Represents the requestor. Expected to be a valid Thomson Reuters user id.';
COMMENT ON COLUMN ocentitlements.ea_entitlement_group_metadata.em_mod_timestamp
     IS 'Insert time on creation or updating of data. Database generated.';

