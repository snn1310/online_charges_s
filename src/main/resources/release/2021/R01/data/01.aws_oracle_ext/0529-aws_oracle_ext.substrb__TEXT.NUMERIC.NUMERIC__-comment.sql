COMMENT ON FUNCTION aws_oracle_ext.substrb
(
    TEXT,
    NUMERIC,
    NUMERIC
)
IS
'Implements Oracle SUBSTRB(). Original PostgreSQL SUBSTRB() uses different logic with negative arguments and rejects numeric argoments for position and length';