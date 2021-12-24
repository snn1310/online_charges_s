INSERT INTO aws_oracle_context.params(param_name, param_value)
SELECT 'key',
    'some_secret_key'
UNION ALL
SELECT
    'auto_clean_interval',
    '1 day'
ON CONFLICT(param_name) DO NOTHING;
