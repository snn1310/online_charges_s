COMMENT ON FUNCTION aws_oracle_ext.substr
(
    TEXT,
    NUMERIC,
    NUMERIC
)
IS
'Implements Oracle SUBSTR(). Original PostgreSQL SUBSTR() uses different logic with negative arguments and rejects numeric argoments for position and length';