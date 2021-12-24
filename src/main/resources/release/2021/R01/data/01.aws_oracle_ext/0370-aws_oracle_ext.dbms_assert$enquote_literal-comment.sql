COMMENT ON FUNCTION aws_oracle_ext.dbms_assert$enquote_literal(TEXT)
IS
'This function verifies that all single quotes except leading and trailing characters are paired with adjacent single quotes. Also function adds leading and trailing single quotes to a string literal.';