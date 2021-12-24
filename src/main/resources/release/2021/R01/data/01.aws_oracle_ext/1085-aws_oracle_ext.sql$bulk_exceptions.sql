CREATE TYPE aws_oracle_ext.sql$bulk_exceptions AS (
error_index BigInt,
error_code TEXT,
sqlerrm TEXT
);