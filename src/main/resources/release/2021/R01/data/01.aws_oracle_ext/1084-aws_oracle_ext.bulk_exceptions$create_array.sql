CREATE OR REPLACE FUNCTION aws_oracle_ext.bulk_exceptions$create_array (
  p_procedure_name varchar
)
RETURNS void AS
$body$
DECLARE
  aws_oracle_ext$array_id$temporary BIGINT;
BEGIN
  aws_oracle_ext$array_id$temporary := aws_oracle_ext.array$create_array(p_array_name => 'bulk_exceptions', p_procedure_name => p_procedure_name);
  PERFORM aws_oracle_ext.array$add_fields_to_array(p_array_id => aws_oracle_ext$array_id$temporary, p_fields => '[{"error_index":"BIGINT"},{"error_code":"INTEGER"},{"sqlerrm":"TEXT"}]');
  PERFORM aws_oracle_ext.array$create_storage_table(p_array_name => 'bulk_exceptions', p_procedure_name => p_procedure_name, p_cast_type_name => 'aws_oracle_ext.sql$bulk_exceptions', pWithData => FALSE);
END;
$body$
LANGUAGE 'plpgsql';