COMMENT ON FUNCTION aws_oracle_ext.dbms_sql$to_cursor_number(REFCURSOR)
IS
'This function takes an opened REFCURSOR and transforms it into a DBMS_SQL cursor number. Once the REFCURSOR is transformed into a DBMS_SQL cursor number, the REFCURSOR is no longer accessible by any native dynamic SQL operations.';