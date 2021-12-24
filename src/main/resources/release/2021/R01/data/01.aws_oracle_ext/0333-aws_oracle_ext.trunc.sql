CREATE OR REPLACE FUNCTION aws_oracle_ext.trunc
(
    IN p_date TIMESTAMP WITHOUT TIME ZONE,
    IN p_fmt TEXT DEFAULT 'DD'
)
RETURNS TIMESTAMP WITHOUT TIME ZONE
AS
$BODY$
    SELECT
        CASE
            WHEN LENGTH(p_fmt) = 0 THEN
                
                NULL::TIMESTAMP
            
            WHEN UPPER(p_fmt) IN
            (
                'CC', 'SCC', 'SYYYY', 'YYYY', 'YEAR', 'SYEAR', 'YYY', 'YY', 'Y', 'Q',
                'MONTH', 'MON', 'MM', 'RM', 'IW', 'DDD', 'DD', 'J', 'HH', 'HH12', 'HH24', 'MI'
            ) THEN

                DATE_TRUNC
                (
                    CASE
                        WHEN UPPER(p_fmt) IN ('CC', 'SCC') THEN 'CENTURY'
                        WHEN UPPER(p_fmt) IN ('SYYYY', 'YYYY', 'YEAR', 'SYEAR', 'YYY', 'YY', 'Y') THEN 'YEAR'
                        WHEN UPPER(p_fmt) = 'Q' THEN 'QUARTER'
                        WHEN UPPER(p_fmt) IN ('MONTH', 'MON', 'MM', 'RM') THEN 'MONTH'
                        WHEN UPPER(p_fmt) = 'IW' THEN 'WEEK'
                        WHEN UPPER(p_fmt) IN ('DDD', 'DD', 'J') THEN 'DAY'
                        WHEN UPPER(p_fmt) IN ('HH', 'HH12', 'HH24') THEN 'HOUR'
                        WHEN UPPER(p_fmt) = 'MI' THEN 'MINUTE'
                    END,
                    p_date
                )
            
            WHEN UPPER(p_fmt) IN ('IYYY', 'IYY', 'IY', 'I') THEN

                CASE
                    WHEN 
                    (
                        EXTRACT 
                        (
                            EPOCH FROM
                            aws_oracle_ext.next_day
                            (
                                TO_TIMESTAMP('01.01.' || extract(ISOYEAR from p_date)::INTEGER, 'DD.MM.YYYY')::TIMESTAMP,
                                'MONDAY'
                            ) - TO_TIMESTAMP('01.01.' || extract(ISOYEAR from p_date)::INTEGER, 'DD.MM.YYYY')::TIMESTAMP
                        )/86400
                    )::INTEGER >= 4 THEN

                        aws_oracle_ext.next_day
                        (
                            TO_TIMESTAMP('01.01.' || extract(ISOYEAR from p_date)::INTEGER, 'DD.MM.YYYY')::TIMESTAMP - INTERVAL '7' DAY,
                            'MONDAY'
                        )
                        
                    ELSE
                        aws_oracle_ext.next_day
                        (
                            TO_TIMESTAMP('01.01.' || extract(ISOYEAR from p_date)::INTEGER, 'DD.MM.YYYY')::TIMESTAMP,
                            'MONDAY'
                        )
                END

            WHEN UPPER(p_fmt) IN ('W', 'WW') THEN

                aws_oracle_ext.next_day
                (
                    DATE_TRUNC('DAY',p_date) - INTERVAL '7' DAY,
                    RTRIM
                    (
                        TO_CHAR
                        (
                            DATE_TRUNC
                            (
                                CASE
                                    WHEN UPPER(p_fmt) = 'W' THEN 'MONTH'
                                    ELSE 'YEAR'
                                END,
                                p_date
                            ),
                            'DAY'
                        )
                    )
                )

            WHEN UPPER(p_fmt) IN ('DAY', 'DY', 'D') THEN
            -- todo d is incorrect 

                aws_oracle_ext.next_day
                (
                    DATE_TRUNC('DAY',p_date) - INTERVAL '7' DAY,
                    'MONDAY'
                )

            ELSE

                DATE_TRUNC(p_fmt, p_date)

        END;

$BODY$
LANGUAGE SQL
RETURNS NULL ON NULL INPUT;