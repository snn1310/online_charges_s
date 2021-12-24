CREATE OR REPLACE VIEW aws_oracle_ext.v$nls_parameters
AS
SELECT * FROM aws_oracle_ext.return_v$nls_parameters();
