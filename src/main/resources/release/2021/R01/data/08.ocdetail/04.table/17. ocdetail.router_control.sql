CREATE TABLE ocdetail.router_control(
    rc_id CHARACTER VARYING(33) NOT NULL,
    rc_instance_name CHARACTER VARYING(50) NOT NULL,
    rc_server_name CHARACTER VARYING(50) NOT NULL,
    rc_location CHARACTER VARYING(10) NOT NULL,
    rc_process_idle CHARACTER(1) NOT NULL,
    rc_available_sites CHARACTER VARYING(25) NOT NULL,
    rc_modified_by CHARACTER VARYING(12) NOT NULL,
    rc_mod_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL
)
        WITH (
        OIDS=FALSE
        );
COMMENT ON COLUMN ocdetail.router_control.rc_id
     IS 'Generated ID';
COMMENT ON COLUMN ocdetail.router_control.rc_instance_name
     IS 'Application instanceName property';
COMMENT ON COLUMN ocdetail.router_control.rc_server_name
     IS 'Server hosting the instance';
COMMENT ON COLUMN ocdetail.router_control.rc_location
     IS 'Server site location';
COMMENT ON COLUMN ocdetail.router_control.rc_process_idle
     IS 'Process idle indicator';
COMMENT ON COLUMN ocdetail.router_control.rc_available_sites
     IS 'List of available sites';
COMMENT ON COLUMN ocdetail.router_control.rc_modified_by
     IS 'Modified by';
COMMENT ON COLUMN ocdetail.router_control.rc_mod_timestamp
     IS 'Modified timestamp';

