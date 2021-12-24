COMMENT ON FUNCTION aws_oracle_ext.dbms_sql$to_refcursor(INTEGER)
IS
'This function takes an opened, parsed and executed cursor and transforms/migrates it into a PL/pgSQL manageable REFCURSOR that can be consumed by any PL/pgSQL function. This subprogram is only used with SELECT cursors.';