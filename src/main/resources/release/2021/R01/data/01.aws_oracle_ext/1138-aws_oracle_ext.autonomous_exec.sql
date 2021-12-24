CREATE OR REPLACE FUNCTION aws_oracle_ext.autonomous_exec
(
  IN  sql_text        TEXT,
  OUT aws_params      JSON,
  OUT aws_session_env JSON
)
AS
$BODY$
DECLARE
  v_result        JSON;
  v_srvname       name;
  v_fdwname       name;
  v_current_user  name;  
  v_connname      text;
  v_connstr       text;
  v_conn_result   text;
  v_send_result   int;
BEGIN
  v_srvname := 'loopback_dblink';
  v_current_user := current_user;
  v_connname := replace(uuid_generate_v4()::text,'-','');
  v_connstr  := v_srvname;

  --Check if the foreign server is present
  IF NOT EXISTS (SELECT 1
                   FROM pg_foreign_server s
                  WHERE s.srvname = v_srvname) THEN
    RAISE USING MESSAGE := format('The FOREIGN SERVER (%s) doesn''t exist.', v_srvname),
                DETAIL := format('The FOREIGN SERVER (%s) must be present.', v_srvname),
                HINT := format('Make sure that the FOREIGN SERVER (%s) exists.', v_srvname);
  END IF;  

  --Check the foreign-data wrapper name of the foreign_server
  SELECT w.fdwname
    INTO v_fdwname
    FROM pg_foreign_server s
    JOIN pg_foreign_data_wrapper w 
      ON w.oid = s.srvfdw
   WHERE s.srvname = v_srvname;
  IF v_fdwname <> 'dblink_fdw' THEN
    RAISE USING MESSAGE := format('The name of FOREIGN DATA WRAPPER (%s) that manages the server (%s) should be dblink_fdw', v_fdwname, v_srvname),
                DETAIL := format('The name of FOREIGN DATA WRAPPER (%s) that manages the server (%s) is not dblink_fdw', v_fdwname, v_srvname),
                HINT := format('Make sure that the FOREIGN SERVER (%s) has been defined using dblink_fdw foreign-data wrapper', v_srvname);
  END IF;  

  --Check if the user mapping is present for current user
  IF NOT EXISTS (SELECT 1
                   FROM pg_user_mappings m
                   JOIN pg_foreign_server s
                     ON s.oid = m.srvid
                  WHERE s.srvname = v_srvname
                    AND m.usename = v_current_user) THEN
    RAISE USING MESSAGE := format('No USER MAPPING exists for the FOREIGN SERVER (%s) and USER (%s).', v_srvname, v_current_user),
                DETAIL := format('The USER MAPPING for the FOREIGN SERVER (%s) and USER (%s) must be present', v_srvname, v_current_user),
                HINT := format('Make sure that the USER MAPPING for the FOREIGN SERVER (%s) and USER (%s) exists.', v_srvname, v_current_user);
  END IF;
 
  --Open the connection  
  SELECT dblink_connect(v_connname,v_connstr) 
    INTO v_conn_result;
  IF v_conn_result <> 'OK' THEN
    RAISE USING MESSAGE := 'An error has occurred while trying to open a loopback dblink connection';
  END IF;

  --Send the query with the autonomous routine call
  SELECT dblink_send_query(v_connname, sql_text) 
    INTO v_send_result;
  IF v_send_result = 0 THEN
    RAISE USING MESSAGE := 'An error has occurred while sending the query';
  END IF;

  --Get the result of the query with the autonomous routine call 
  SELECT t.aws_params, t.aws_session_env 
    INTO aws_params, aws_session_env
    FROM dblink_get_result(v_connname) 
      AS t(aws_params JSON, aws_session_env JSON);
    
  --Close a connection
  SELECT dblink_disconnect(v_connname) 
    INTO v_conn_result;
  IF v_conn_result <> 'OK' THEN
    RAISE USING MESSAGE := 'An error has occurred while trying to close a loopback dblink connection';
  END IF;
EXCEPTION
  WHEN OTHERS THEN
    --Check if the connection exists
    IF v_connname = ANY(dblink_get_connections()) THEN
      PERFORM dblink_disconnect(v_connname);
    END IF;
    RAISE;
END;
$BODY$
LANGUAGE plpgsql;
