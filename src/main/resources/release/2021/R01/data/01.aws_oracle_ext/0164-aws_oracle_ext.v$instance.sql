CREATE OR REPLACE VIEW aws_oracle_ext.v$instance
AS
SELECT aws_oracle_ext.dbms_utility$current_instance() AS instance_number,
       inet_server_addr()::VARCHAR AS instance_name,
       inet_server_addr()::VARCHAR AS host_name,
       current_setting('server_version_num') AS version,
       pg_postmaster_start_time() AS startup_time,
       'OPEN'::VARCHAR AS status,
       'NO'::VARCHAR AS parallel,
       1::INTEGER AS "THREAD#",
       'FAILED'::VARCHAR AS archiver,
       NULL::VARCHAR AS log_switch_wait,
       'ALLOWED'::VARCHAR AS logins,
       'NO'::VARCHAR AS shutdown_pending,
       'ACTIVE'::VARCHAR AS database_status,
       'PRIMARY_INSTANCE'::VARCHAR AS instance_role,
       'NORMAL'::VARCHAR AS active_state,
       'NO'::VARCHAR AS blocked;