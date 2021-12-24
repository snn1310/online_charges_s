COMMENT ON FUNCTION aws_oracle_ext.strip_sql_comments(IN p_sql_statement TEXT,
                                                      IN p_skip_hints BOOLEAN,
                                                      IN p_adv_quote_tags TEXT[],
                                                      IN p_validate_multiline BOOLEAN)
IS
'This function removes single and multi-line comments from SQL statement. Available validation (check for unpaired) of multi-line comments within SQL statement. Oracle Database Optimizer Hints removal can be skipped as well.';