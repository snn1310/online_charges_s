CREATE OR REPLACE FUNCTION aws_oracle_ext.get_base_type_by_dtype(IN p_data_type TEXT)
RETURNS TEXT
AS $$
SELECT CASE p_data_type
          -- character data types
          WHEN 'TEXT' THEN 'TEXT'
          WHEN 'CHARACTER' THEN 'TEXT'
          WHEN 'CHARACTER VARYING' THEN 'TEXT'
          -- numeric data types
          WHEN 'BIGINT' THEN 'NUMERIC'
          WHEN 'INTEGER' THEN 'NUMERIC'
          WHEN 'NUMERIC' THEN 'NUMERIC'
          WHEN 'SMALLINT' THEN 'NUMERIC'
          WHEN 'REAL' THEN 'DOUBLE PRECISION'
          WHEN 'DOUBLE PRECISION' THEN 'DOUBLE PRECISION'
          -- date/time data types
          WHEN 'DATE' THEN 'TIMESTAMP WITHOUT TIME ZONE'
          WHEN 'TIME WITHOUT TIME ZONE' THEN 'TIMESTAMP WITHOUT TIME ZONE'
          ELSE p_data_type
       END
$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;