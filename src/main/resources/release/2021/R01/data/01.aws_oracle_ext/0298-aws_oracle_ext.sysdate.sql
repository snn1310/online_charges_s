CREATE OR REPLACE FUNCTION aws_oracle_ext.sysdate()
RETURNS TIMESTAMP WITHOUT TIME ZONE AS
$BODY$

    SELECT CONCAT
    (
        COALESCE
        (
            MAX(tz_offset),
            0
        )::TEXT,
        ' HOURS'
    )::INTERVAL + clock_timestamp()::TIMESTAMP(0) 
    FROM aws_oracle_data.aws_oracle_ext_session_local_tz;
    
$BODY$
STABLE
LANGUAGE SQL;
