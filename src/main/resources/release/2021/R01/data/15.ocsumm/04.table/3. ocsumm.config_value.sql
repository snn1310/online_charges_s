CREATE TABLE ocsumm.config_value(
    cv_id CHARACTER VARYING(33) NOT NULL,
    cv_domain CHARACTER VARYING(15),
    cv_company_code CHARACTER VARYING(4),
    cv_config_item CHARACTER VARYING(50) NOT NULL,
    cv_config_item_value CHARACTER VARYING(50) NOT NULL,
    cv_eff_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    cv_end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    cv_modified_by CHARACTER VARYING(12) NOT NULL,
    cv_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    cv_sap_valid_value_ind CHARACTER(1) NOT NULL DEFAULT 'N',
    cv_usage_valid_value_ind CHARACTER(1) NOT NULL DEFAULT 'N',
    cv_value_desc CHARACTER VARYING(100)
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN ocsumm.config_value.cv_id
     IS 'GUID.';
COMMENT ON COLUMN ocsumm.config_value.cv_domain
     IS 'Config domain name.';
COMMENT ON COLUMN ocsumm.config_value.cv_company_code
     IS 'Config company code.';
COMMENT ON COLUMN ocsumm.config_value.cv_config_item
     IS 'Config item name.';
COMMENT ON COLUMN ocsumm.config_value.cv_config_item_value
     IS 'Config value name.';
COMMENT ON COLUMN ocsumm.config_value.cv_eff_date
     IS 'Date config value is active.';
COMMENT ON COLUMN ocsumm.config_value.cv_end_date
     IS 'Date config value expires.';
COMMENT ON COLUMN ocsumm.config_value.cv_modified_by
     IS 'Last modified by.';
COMMENT ON COLUMN ocsumm.config_value.cv_mod_timestamp
     IS 'Timestamp of last modify.';
COMMENT ON COLUMN ocsumm.config_value.cv_sap_valid_value_ind
     IS 'Valid Value is used by SAP.';
COMMENT ON COLUMN ocsumm.config_value.cv_usage_valid_value_ind
     IS 'Valid Value is used by Usage Processors.';
COMMENT ON COLUMN ocsumm.config_value.cv_value_desc
     IS 'Description for each individual value.';

