/*
Nls parameters transfered from Oracle
*/
COMMENT ON TABLE aws_oracle_ext.nls_parameters IS 'Dictionary to store NLS related params transfered from Oracle';
COMMENT ON COLUMN aws_oracle_ext.nls_parameters.nls_territory IS 'NLS_TERRITORY from Oracle';
COMMENT ON COLUMN aws_oracle_ext.nls_parameters.pg_territory_ux IS 'NLS_TERRITORY stored as part of Unix Locale';
COMMENT ON COLUMN aws_oracle_ext.nls_parameters.pg_territory_win IS 'NLS_TERRITORY stored as part of Window Locale';
COMMENT ON COLUMN aws_oracle_ext.nls_parameters.params_dictionary IS 'Nested JSON table to store actual parameters values';
