COMMENT ON FUNCTION aws_oracle_ext.dbms_sql$execute_and_fetch(INTEGER,
                                                              BOOLEAN)
IS
'This function executes the given cursor and fetches rows. Raise an exception if the number of rows matching the query differs from one.';