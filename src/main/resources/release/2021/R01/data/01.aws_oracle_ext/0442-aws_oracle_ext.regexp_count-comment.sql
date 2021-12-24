COMMENT ON FUNCTION aws_oracle_ext.regexp_count(TEXT,
                                                TEXT,
                                                NUMERIC,
                                                TEXT)
IS
'Returns a count of the number of times that a regular expression pattern is matched in a string. If the pattern expression is not found and no argument is null, the result is 0.';