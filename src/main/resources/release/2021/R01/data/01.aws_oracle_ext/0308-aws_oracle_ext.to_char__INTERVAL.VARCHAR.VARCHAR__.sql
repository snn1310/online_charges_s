CREATE OR REPLACE FUNCTION aws_oracle_ext.to_char
(
    pVal      IN INTERVAL,
    pFmt      IN VARCHAR,
    pNlsParam IN VARCHAR DEFAULT NULL
)
RETURNS VARCHAR
LANGUAGE plpgsql
AS
$BODY$
DECLARE
    vResult VARCHAR DEFAULT NULL;
    vFmt VARCHAR;
BEGIN

    IF pVal IS NOT NULL THEN
        
        IF LENGTH(pFmt) <> 0 THEN

            vFmt := aws_oracle_ext.to_char_formatter
            (
                pVal      => pVal,
                pFormat   => pFmt,
                pNlsParam => pNlsParam
            );
            -- it is year to month 
            IF pVal::TEXT ~* 'YEAR' OR pVal::TEXT ~* 'MON' THEN

                vResult := CONCAT
                (
                    COALESCE(SUBSTRING(EXTRACT(year FROM pVal)::TEXT FROM '-'),'+'),
                    CASE
                        WHEN EXTRACT(year FROM pVal) < 2 THEN
                            LPAD(SUBSTRING(EXTRACT(year FROM pVal)::TEXT FROM '\d+'), 2, '0')
                        ELSE
                            SUBSTRING(EXTRACT(year FROM pVal)::TEXT FROM '\d+')
                    END,
                    '-',
                    LPAD(ABS(EXTRACT(month FROM pVal))::TEXT, 2, '0')
                );
            -- it is day to second
            ELSE

                vResult := CONCAT
                (
                    COALESCE(SUBSTRING(EXTRACT(day FROM pVal)::TEXT FROM '\-'),'+'),
                    LPAD(SUBSTRING(EXTRACT(day FROM pVal)::TEXT FROM '\d+'), 2, '0'),
                    ' ',
                    LPAD(EXTRACT(hour FROM pVal)::TEXT, 2, '0'),
                    ':',
                    LPAD(EXTRACT(minute FROM pVal)::TEXT, 2, '0'),
                    ':',
                    CASE 
                        WHEN STRPOS(pVal::TEXT, '.') >0 THEN
                            REGEXP_REPLACE(LPAD(EXTRACT(microseconds FROM pVal)::TEXT, 8, '0'), '(\d\d)(\d+)', '\1.\2')
                        ELSE
                            LPAD(EXTRACT(seconds FROM pVal)::TEXT, 2, '0')
                    END
                );

            END IF;

        END IF;

    END IF;

    RETURN vResult;

END;
$BODY$;

