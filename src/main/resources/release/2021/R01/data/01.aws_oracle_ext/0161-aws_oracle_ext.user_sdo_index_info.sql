CREATE OR REPLACE VIEW aws_oracle_ext.user_sdo_index_info AS
SELECT pgis.indexname::CHARACTER VARYING(32) AS index_name,
	   gc.f_table_schema::CHARACTER VARYING(30) AS table_owner,
	   pgis.tablename::CHARACTER VARYING(30) AS table_name,
	   gc.f_geometry_column::CHARACTER VARYING(2048) AS column_name,
	   'rtree'::CHARACTER VARYING(32) AS sdo_index_type,
	   NULL::CHARACTER VARYING(32) AS sdo_index_table,
	   (CASE pgi.indisvalid WHEN 'true' THEN 'valid' WHEN 'false' THEN 'invalid' END)::CHARACTER VARYING(32) sdo_index_status
FROM pg_catalog.pg_indexes pgis
     INNER JOIN geometry_columns gc
                ON pgis.schemaname = gc.f_table_schema AND pgis.tablename = gc.f_table_name      
     LEFT JOIN pg_catalog.pg_class t -- table
                ON t.relname = pgis.tablename          
     LEFT JOIN pg_catalog.pg_index pgi
                ON t.oid = pgi.indrelid
     LEFT JOIN pg_catalog.pg_class c -- index
                ON pgi.indexrelid = c.oid AND c.relname = pgis.indexname
     LEFT JOIN pg_tables p
                ON gc.f_table_schema = p.schemaname AND gc.f_table_name = p.tablename
WHERE p.tableowner = current_user;
           
COMMENT ON VIEW aws_oracle_ext.user_sdo_index_info IS
'Contains index information for all spatial tables owned by the user.';