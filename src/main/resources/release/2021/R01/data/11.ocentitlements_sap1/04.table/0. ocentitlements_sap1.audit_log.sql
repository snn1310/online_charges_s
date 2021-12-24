CREATE TABLE ocentitlements_sap1.audit_log(
    al_audit_id CHARACTER VARYING(33) NOT NULL,
    al_api CHARACTER VARYING(255),
    al_app_environment CHARACTER VARYING(10) NOT NULL,
    al_change_action CHARACTER VARYING(10) NOT NULL,
    al_primary_key CHARACTER VARYING(256) NOT NULL,
    al_root_guid CHARACTER VARYING(33) NOT NULL,
    al_table_name CHARACTER VARYING(100) NOT NULL,
    al_data CHARACTER VARYING(4000) NOT NULL,
    al_modified_by CHARACTER VARYING(12) NOT NULL,
    al_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN ocentitlements_sap1.audit_log.al_audit_id
     IS 'Audit log entry guid.';
COMMENT ON COLUMN ocentitlements_sap1.audit_log.al_api
     IS 'Web service api.';
COMMENT ON COLUMN ocentitlements_sap1.audit_log.al_app_environment
     IS 'Environment hosting web service.';
COMMENT ON COLUMN ocentitlements_sap1.audit_log.al_change_action
     IS 'Identifies change as update or delete.';
COMMENT ON COLUMN ocentitlements_sap1.audit_log.al_primary_key
     IS 'List of values from primary key of changed data.';
COMMENT ON COLUMN ocentitlements_sap1.audit_log.al_root_guid
     IS 'Root guid of request that generated audit log entry.';
COMMENT ON COLUMN ocentitlements_sap1.audit_log.al_table_name
     IS 'Database name of table that contained original data.';
COMMENT ON COLUMN ocentitlements_sap1.audit_log.al_data
     IS 'Pre-change data object.';
COMMENT ON COLUMN ocentitlements_sap1.audit_log.al_modified_by
     IS 'User or system performing modification.';
COMMENT ON COLUMN ocentitlements_sap1.audit_log.al_mod_timestamp
     IS 'Timestamp when last modified.';

