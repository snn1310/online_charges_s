CREATE TABLE ccdetail.control_table(
    ct_id CHARACTER VARYING(33) NOT NULL,
    ct_domain CHARACTER VARYING(15) NOT NULL,
    ct_target CHARACTER VARYING(18) NOT NULL,
    ct_source CHARACTER VARYING(18) NOT NULL,
    ct_status CHARACTER VARYING(18) NOT NULL,
    ct_start_time TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    ct_end_time TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    ct_usage_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    ct_restart_id CHARACTER VARYING(33),
    ct_modified_by CHARACTER VARYING(12) NOT NULL,
    ct_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ccdetail.control_table
     IS 'Control Table';
COMMENT ON COLUMN ccdetail.control_table.ct_id
     IS 'Generated Id.';
COMMENT ON COLUMN ccdetail.control_table.ct_domain
     IS 'Domain.';
COMMENT ON COLUMN ccdetail.control_table.ct_target
     IS 'Target.';
COMMENT ON COLUMN ccdetail.control_table.ct_source
     IS 'Source.';
COMMENT ON COLUMN ccdetail.control_table.ct_status
     IS 'Status.';
COMMENT ON COLUMN ccdetail.control_table.ct_start_time
     IS 'Start time.';
COMMENT ON COLUMN ccdetail.control_table.ct_end_time
     IS 'End time.';
COMMENT ON COLUMN ccdetail.control_table.ct_usage_date
     IS 'Usage date.';
COMMENT ON COLUMN ccdetail.control_table.ct_restart_id
     IS 'Restart id.';
COMMENT ON COLUMN ccdetail.control_table.ct_modified_by
     IS 'Modified by.';
COMMENT ON COLUMN ccdetail.control_table.ct_mod_timestamp
     IS 'Modified timestamp.';

