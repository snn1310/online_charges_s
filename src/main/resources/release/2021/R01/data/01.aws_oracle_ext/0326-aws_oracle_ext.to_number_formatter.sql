CREATE OR REPLACE FUNCTION aws_oracle_ext.to_number_formatter
(
    pVal            IN ANYELEMENT,
    pFormat         IN VARCHAR DEFAULT NULL,
    pNlsParam       IN VARCHAR DEFAULT NULL,
    pNoNumberFormat IN VARCHAR DEFAULT NULL
) 
RETURNS NUMERIC
LANGUAGE plpgsql
    VOLATILE 
AS 
$BODY$
DECLARE
    rec RECORD;
    cAllowedDatatypes CONSTANT VARCHAR[] := ARRAY
    [
        'NUMERIC',
        'INTEGER',
        'CHARACTER',
        'CHARACTER VARYING',
        'TEXT'
    ];
    vResult NUMERIC DEFAULT NULL;
    vDataType VARCHAR;
    verrorMessages CONSTANT VARCHAR[] := ARRAY
    [
        'ORA-00902: invalid datatype', --1
        'ORA-22835: Buffer too small for CLOB to CHAR', --2
        'ORA-01481: invalid number format model', --3
        'ORA-12702: invalid NLS parameter string used in SQL function', --4
        'ORA-01722: invalid number', --5
        'ORA-01481: invalid number format model' --6
    ];
    vNlsParam VARCHAR;
    vNlsParamCopy VARCHAR;
    vGroupSeparator VARCHAR(2) DEFAULT NULL;
    vDecimalSeparator VARCHAR(2) DEFAULT NULL;
    vCurrencySymbol VARCHAR;
    vIsoCurrency VARCHAR;
    vDualCurrency VARCHAR;
    vVal VARCHAR;
    vFmt VARCHAR;
    vtail VARCHAR;
    vfm VARCHAR;
    vTextResult VARCHAR;
    bd BOOLEAN DEFAULT FALSE;
    vurrisset BOOLEAN DEFAULT FALSE;
BEGIN

    vDataType := UPPER(PG_TYPEOF(pVal)::VARCHAR);

    IF ARRAY_POSITION(cAllowedDatatypes,  vDataType) IS NULL THEN

        RAISE USING MESSAGE := verrorMessages[1];

    END IF;

    vVal := pVal::TEXT;

    IF LENGTH(vVal) > 4000 THEN

        RAISE USING MESSAGE := verrorMessages[2];

    END IF;

    IF pNoNumberFormat IS NOT NULL THEN
        
        vResult := pVal::NUMERIC;
        bd := TRUE;

    ELSE

        CASE
            WHEN pNlsParam = '' THEN

                vResult := NULL;

            WHEN pNlsParam IS NOT NULL THEN

                SELECT STRING_AGG(CASE WHEN nls ~* 'CALENDAR' THEN '' ELSE nls END, '')
                INTO vNlsParamCopy
                FROM REGEXP_SPLIT_TO_TABLE
                ( 
                    TRIM(E'\n\ ' FROM pNlsParam),
                    'NLS_',
                'i') nls;
                
                vNlsParam := REGEXP_REPLACE
                (
                    vNlsParamCopy,
                    $$NUMERIC_CHARACTERS\s*=\s*('?)(.+?)('?)$$,
                    '',
                    'i'
                );

                vNlsParam := REGEXP_REPLACE
                (
                    vNlsParam,
                    $$ISO_CURRENCY\s*=\s*('?)(.+?)('?)$$,
                    '',
                    'i'
                );

                vNlsParam := REGEXP_REPLACE
                (
                    vNlsParam,
                    $$CURRENCY\s*=\s*('?)(.+?)('?)$$,
                    '',
                    'i'
                );

                IF LENGTH(TRIM(E'\n\ ' FROM vNlsParam)) > 0 THEN

                    RAISE USING MESSAGE := verrorMessages[4];

                END IF;

                -- Try to get set NLS parts
                FOR rec IN 
                (
                    SELECT REGEXP_MATCHES
                    (
                        vNlsParamCopy,
                        $$NUMERIC_CHARACTERS\s*=\s*('?)(.+?)('?)$$,
                        'i'
                    ) m
                ) LOOP

                    vDecimalSeparator := SUBSTR((rec.m)[2], 1, 1);
                  
                    IF LENGTH(vDecimalSeparator) = 0 THEN

                        RAISE USING MESSAGE := verrorMessages[4];

                    END IF;

                    vGroupSeparator := SUBSTR((rec.m)[2], 2, 1);

                    IF LENGTH(vGroupSeparator) = 0 THEN

                        RAISE USING MESSAGE := verrorMessages[4];

                    END IF;

                END LOOP;

                FOR rec IN 
                (
                    SELECT REGEXP_MATCHES
                    (
                        vNlsParamCopy,
                        $$CURRENCY\s*=\s*('?)(.+?)('?)$$,
                        'i'
                    ) m
                ) LOOP

                    vCurrencySymbol := (rec.m)[2];

                    IF LENGTH(vCurrencySymbol) = 0 THEN

                        RAISE USING MESSAGE := verrorMessages[4];

                    END IF;

                END LOOP;

                FOR rec IN 
                (
                    SELECT REGEXP_MATCHES
                    (
                        vNlsParamCopy,
                        $$ISO_CURRENCY\s*=\s*('?)(.+?)('?)$$,
                        'i'
                    ) m
                ) LOOP

                    vIsoCurrency := (rec.m)[2];

                    IF LENGTH(vIsoCurrency) = 0 THEN

                        RAISE USING MESSAGE := verrorMessages[4];

                    END IF;

                    SELECT icl.code
                    INTO vIsoCurrency
                    FROM aws_oracle_ext.iso_currency_list icl
                    WHERE icl.nls_iso_currency = (rec.m)[2];

                END LOOP;

            ELSE

                NULL;       

        END CASE;

        vtail:= pFormat;

        LOOP

            SELECT ok, tail, fm
            INTO vFmt, vtail, vfm
            FROM aws_oracle_ext.to_char_parser
            (
                pStr  => vtail,
                pType => 'number',
                pFm   => vfm
            );
            
        
            vTextResult := CONCAT(vTextResult, vFmt);

            EXIT WHEN vtail IS NULL;

        END LOOP;

        /* Restrictions */
            --A comma element cannot begin a number format model
        IF SUBSTR(vTextResult, 1, 1) = ',' THEN

            RAISE USING MESSAGE := verrorMessages[6];

        END IF;
        -- A comma cannot appear to the right of a decimal
        -- character or period in a number format model
        CASE 
            WHEN vTextResult ~* '[\.D].*\,' THEN

                RAISE USING MESSAGE := verrorMessages[6];
            --only one period in a number format model
            WHEN vTextResult ~ '\..*\.' THEN

                RAISE USING MESSAGE := verrorMessages[6];
            -- only one decimal character in a number format model
            WHEN vTextResult ~* 'd.*d' THEN

                RAISE USING MESSAGE := verrorMessages[6];
            -- group separator cannot appear to the right of a decimal 
            -- character or period in a number format model
            -- V also
            WHEN vTextResult ~* '[\.DV].*g' THEN

                RAISE USING MESSAGE := verrorMessages[6];
            -- Start with g is not allowed
            WHEN vTextResult ~* '^G' THEN

                RAISE USING MESSAGE := verrorMessages[6];
            -- It's not allowed to mix different type group and
            -- decimal model symbols
            WHEN vTextResult ~ '\.|\,' AND vTextResult ~* 'D|G' THEN

                RAISE USING MESSAGE := verrorMessages[6];
            -- The MI format element can appear only in the last position 
            -- of a number format model
            WHEN vTextResult ~* 'MI.+' THEN

                RAISE USING MESSAGE := verrorMessages[6];
            --The PR format element can appear only in the last position
            -- of a number format model
            WHEN vTextResult ~* 'PR.+' THEN

                RAISE USING MESSAGE := verrorMessages[6];
            -- The S format element can appear only in the first 
            -- or last position of a number format model
            WHEN vTextResult ~* '[^S]+S[^S]+' OR vTextResult ~* 'S[^S]*S' THEN

                RAISE USING MESSAGE := verrorMessages[6];
            -- You cannot precede this element with any other element
            WHEN vTextResult ~* '.+TM' THEN

                RAISE USING MESSAGE := verrorMessages[6];
            -- You can follow this element only with one 9 or 
            -- one E (or e), but not with any combination of these
            WHEN vTextResult ~* 'TM.{2,}' THEN

                RAISE USING MESSAGE := verrorMessages[6];
            WHEN vTextResult ~* 'TM[^9e]' THEN

                RAISE USING MESSAGE := verrorMessages[6];
            -- You can precede this element only with 0 (which returns leading zeroes)
            -- or FM. Any other elements return an error
            WHEN vTextResult ~* '.*X.?'
                AND vTextResult !~* '^0+X{1,}$'
                AND vTextResult !~* '^FMX{1,}$'
                AND vTextResult !~* '^FM0{1,}X{1,}$'
                AND vTextResult !~* '^X{1,}$' THEN

                    RAISE USING MESSAGE := verrorMessages[6];
            -- only one $ allowed
            WHEN vTextResult ~ '\$.*\$' THEN

                RAISE USING MESSAGE := verrorMessages[6];
            -- only one C allowed
            WHEN vTextResult ~* 'C.*C' THEN

                RAISE USING MESSAGE := verrorMessages[6];
            -- only one L allowed
            WHEN vTextResult ~* 'L.*L' THEN

                RAISE USING MESSAGE := verrorMessages[6];
            -- only one U allowed
            WHEN vTextResult ~* 'U.*U' THEN

                RAISE USING MESSAGE := verrorMessages[6];
            -- C, L, $, U together is not allowed
            WHEN vTextResult ~* 'C.*[\$LU]' THEN

                RAISE USING MESSAGE := verrorMessages[6];
            WHEN vTextResult ~* '[UL\$].*C' THEN

                RAISE USING MESSAGE := verrorMessages[6];
            -- only one V allowed
            WHEN vTextResult ~* 'V.*V' THEN

                RAISE USING MESSAGE := verrorMessages[6];
            -- V and period or decimal is not allowed
            WHEN vTextResult ~* 'V.*[\.D]' OR vTextResult ~* '[\.D].*V' THEN

                RAISE USING MESSAGE := verrorMessages[6];
            -- If RN - no other models allowed
            WHEN vTextResult ~* '.+RN' OR vTextResult ~* 'RN.+' THEN

                RAISE USING MESSAGE := verrorMessages[6];
            -- Only EEEE is not allowed. No chars after EEEE. No comma before EEEE
            WHEN vTextResult ~* '^EEEE$' 
                OR vTextResult ~* 'EEEE[^S]+' 
                OR vTextResult ~* '\,.*EEEE'
                OR vTextResult ~* 'EEEE.{2,}' THEN

                    RAISE USING MESSAGE := verrorMessages[6];
            ELSE

                NULL;
        END CASE;
        
        -- converting
        IF vTextResult ~* 'U|C|L' THEN

            bd := TRUE;

                IF vTextResult ~* 'U' THEN

                    IF vDualCurrency IS NULL THEN

                        SELECT value
                        INTO vDualCurrency
                        FROM aws_oracle_ext.v$nls_parameters WHERE parameter = 'NLS_DUAL_CURRENCY';

                    END IF;

                    vVal := REGEXP_REPLACE(vVal, vDualCurrency, '$', 'i');
                    vTextResult := REGEXP_REPLACE(vTextResult, 'U', '$', 'i');
                    vurrisset := TRUE;

                END IF;

                IF vTextResult ~* 'C' AND NOT vurrisset THEN

                    IF vIsoCurrency IS NULL THEN

                        SELECT icl.code
                        INTO vIsoCurrency
                        FROM aws_oracle_ext.iso_currency_list icl
                        WHERE icl.nls_iso_currency = (SELECT value
                        FROM aws_oracle_ext.v$nls_parameters WHERE parameter = 'NLS_ISO_CURRENCY');

                    END IF;

                    vVal := REGEXP_REPLACE(vVal, vIsoCurrency, '$' , 'i');
                    vTextResult := REGEXP_REPLACE(vTextResult, 'C', '$', 'i');
                    vurrisset := TRUE;

                END IF;

                IF vTextResult ~* 'L'  AND NOT vurrisset THEN

                    IF vCurrencySymbol IS NULL THEN

                        SELECT value
                        INTO vCurrencySymbol
                        FROM aws_oracle_ext.v$nls_parameters
                        WHERE parameter = 'NLS_CURRENCY';

                    END IF;

                    vVal := REGEXP_REPLACE(vVal, vCurrencySymbol, '$' , 'i');
                    vTextResult := REGEXP_REPLACE(vTextResult, 'L', '$', 'i');

                    vurrisset := TRUE;

                END IF;

        END IF;

        IF vTextResult ~* 'G|D' AND vDecimalSeparator IS NOT NULL AND vGroupSeparator IS NOT NULL THEN

            bd := TRUE;

            vVal := REPLACE(vVal, vGroupSeparator, '#,');

            IF vDecimalSeparator = ',' THEN

                vVal := REGEXP_REPLACE(vVal, '([^#]),', '\1#.');

            ELSE

                vVal := REPLACE(vVal, vDecimalSeparator, '#.');

            END IF;

            vVal := REPLACE(vVal, '#.', '.');
            vVal := REPLACE(vVal, '#,', ',');

            vTextResult := REGEXP_REPLACE(vTextResult, 'D', '.', 'i');
            vTextResult := REGEXP_REPLACE(vTextResult, 'G', ',', 'ig');

        END IF;
        
        CASE
            WHEN vTextResult ~* 'X' THEN

                bd := TRUE;

                EXECUTE 'SELECT x''' || vVal || '''::BIGINT::NUMERIC' INTO vResult;

            WHEN vTextResult ~* 'EEEE' THEN

                bd := TRUE;

                vResult := vVal::NUMERIC;

            ELSE

                vResult := TO_NUMBER(vVal, vTextResult);

        END CASE;

    END IF;

    IF NOT bd THEN

        INSERT INTO aws_oracle_data.tnfmt
        VALUES(pFormat)
        ON CONFLICT ON CONSTRAINT tnfmt_pkey DO NOTHING;

    END IF;

    RETURN aws_oracle_ext.number_limit_correct(vResult);

END;
$BODY$;

