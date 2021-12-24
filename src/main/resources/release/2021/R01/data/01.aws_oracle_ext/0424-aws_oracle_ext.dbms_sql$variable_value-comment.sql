COMMENT ON FUNCTION aws_oracle_ext.dbms_sql$variable_value(INTEGER,
                                                           TEXT,
                                                           ANYELEMENT)
IS
'This procedure returns the value of the named variable for a given cursor. It is used to return the values of bind variables inside PL/pgSQL blocks or DML statements with returning clause.';