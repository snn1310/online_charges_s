COMMENT ON FUNCTION aws_oracle_ext.dbms_sql$column_value_long(INTEGER,
                                                              INTEGER,
                                                              INTEGER,
                                                              INTEGER,
                                                              TEXT,
                                                              NUMERIC,
                                                              NUMERIC)
IS
'This procedure returns part of the value of a TEXT column for a given position, offset, and size in a given cursor. This procedure is used to access the data fetched by calling `dbms_sql$fetch_rows` function.';