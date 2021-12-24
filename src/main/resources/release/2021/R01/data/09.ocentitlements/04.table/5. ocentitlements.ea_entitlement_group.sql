CREATE TABLE ocentitlements.ea_entitlement_group(
    entitlement_group_table_id CHARACTER VARYING(33) NOT NULL,
    entitlement_group_id CHARACTER VARYING(25) NOT NULL,
    business_system_id CHARACTER VARYING(12) NOT NULL,
    group_type CHARACTER VARYING(35) NOT NULL,
    modified_by CHARACTER VARYING(12) NOT NULL,
    eg_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL DEFAULT aws_oracle_ext.systimestamp()
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN ocentitlements.ea_entitlement_group.entitlement_group_table_id
     IS 'Database generated counter.';
COMMENT ON COLUMN ocentitlements.ea_entitlement_group.entitlement_group_id
     IS 'ID representing the entitlement group.  Calling business system defines the value, but it must be unique per Business System ID. Some sample entitlement group levels could be account, subscription, material number, etc...';
COMMENT ON COLUMN ocentitlements.ea_entitlement_group.business_system_id
     IS 'ID representing the business system calling the service.';
COMMENT ON COLUMN ocentitlements.ea_entitlement_group.group_type
     IS 'Type of item you are entitling.  Service generates via the URL.';
COMMENT ON COLUMN ocentitlements.ea_entitlement_group.modified_by
     IS 'Represents the requestor. Expected to be a valid Thomson Reuters user id.';
COMMENT ON COLUMN ocentitlements.ea_entitlement_group.eg_mod_timestamp
     IS 'Insert time on creation or updating of data. Database generated.';

