CREATE OR REPLACE VIEW aws_oracle_ext.all_sdo_geom_metadata AS
SELECT p.tableowner::CHARACTER VARYING(32) AS owner,
	   g.f_table_name::CHARACTER VARYING(32) AS table_name,
	   g.f_geometry_column::CHARACTER VARYING(1024) AS column_name,
	   NULL AS diminfo,
	   g.srid::DOUBLE PRECISION
FROM geometry_columns g
LEFT JOIN pg_tables p ON g.f_table_schema = p.schemaname AND g.f_table_name = p.tablename;

COMMENT ON VIEW aws_oracle_ext.all_sdo_geom_metadata IS
'Contains metadata information for all spatial tables on which the user has SELECT permission.';