COMMENT ON TABLE aws_oracle_ext.format_models IS 'Possible format models for to_char from Oracle';
COMMENT ON COLUMN aws_oracle_ext.format_models.fmt IS 'Format model value';
COMMENT ON COLUMN aws_oracle_ext.format_models.tp IS 'Format model type: datetime/numeric';
COMMENT ON COLUMN aws_oracle_ext.format_models.ord IS 'Used in format model parser to select model best match';
COMMENT ON COLUMN aws_oracle_ext.format_models.grp IS 'Used in format model parser to speed up search';
COMMENT ON COLUMN aws_oracle_ext.format_models.wrapto IS 'Used in format model parser to replace Oracle model with PG model if needed';