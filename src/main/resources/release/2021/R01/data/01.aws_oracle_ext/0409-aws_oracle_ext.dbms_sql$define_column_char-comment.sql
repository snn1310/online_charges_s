COMMENT ON FUNCTION aws_oracle_ext.dbms_sql$define_column_char(INTEGER,
                                                               INTEGER,
                                                               ANYELEMENT,
                                                               INTEGER)
IS
'The procedure defines a fixed-length CHAR column to be selected from the given cursor, used only with SELECT statements. The column being defined is identified by its relative position in the SELECT list of the statement in the given cursor.';