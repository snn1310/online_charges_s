/* Utility making modifications to return data as Oracle to_char
*/
CREATE OR REPLACE FUNCTION aws_oracle_ext.to_char_formatter
(
    pVal            IN ANYELEMENT,
    pFormat         IN VARCHAR DEFAULT NULL,
    pNlsParam       IN VARCHAR DEFAULT NULL,
    pNoNumberFormat IN VARCHAR DEFAULT NULL
) 
RETURNS VARCHAR
LANGUAGE plpgsql
AS 
$BODY$
DECLARE
    vFmt VARCHAR;
    rec RECORD;
    vResult VARCHAR;
    vDataType VARCHAR;
    vIsDateTime BOOLEAN DEFAULT FALSE;
    cAllowedDatatypes CONSTANT VARCHAR[] := ARRAY
    [
        -- numeric
        'REAL',
        'DOUBLE PRECISION',
        'NUMERIC',
        'INTEGER',
        --datetime
        'INTERVAL',
        'TIMESTAMP WITHOUT TIME ZONE',
        'TIMESTAMP WITH TIME ZONE',
        -- char
        'CHARACTER',
        'CHARACTER VARYING',
        'TEXT'

    ];
    cpellmodels CONSTANT TEXT[] := ARRAY
    [
        'SSSP',
        'Y,YYYSP',
        'SYYYYSP',
        'YYYYSP',
        'YYYSP',
        'YYSP',
        'YSP',
        'SCCSP',
        'CCSP',
        'RRRRSP',
        'RRSP',
        'HH24SP',
        'HH12SP',
        'HHSP',
        'DDDSP',
        'DDSP',
        'DSP',
        'MISP',
        'MMSP',
        'QSP',
        'TZHSP',
        'TZMSP',
        'FFSP',
        'FF1SP',
        'FF2SP',
        'FF3SP',
        'FF4SP',
        'FF5SP',
        'FF6SP',
        'FF7SP',
        'FF8SP',
        'FF9SP'
    ];
    vIsNumeric BOOLEAN DEFAULT FALSE;
    vIsChar BOOLEAN DEFAULT FALSE;

    verrorMessages CONSTANT VARCHAR[] := ARRAY
    [
        'ORA-01722: invalid number', --1
        'ORA-01821: date format not recognized', --2
        'ORA-01822: era format code is not valid with this calendar', --3
        'not implemented', --4
        'ORA-12702: invalid NLS parameter string used in SQL function', --5
        'ORA-01481: invalid number format model', --6
        'ORA-22835: Buffer too small for CLOB to CHAR', --7
        'ORA-00902: invalid datatype' --8
    ];

    v_lctime VARCHAR;
    vNlsParam VARCHAR;
    vNlsParamCopy VARCHAR;
    vDayMaxLengh INTEGER;
    vDyMaxLengh INTEGER;
    vMonthMaxLength INTEGER;
    vMonMaxLength INTEGER;
    --used to calculate localized day/month names
    cDayMonthNumbers CONSTANT INTEGER[] := ARRAY[1,2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    vTm VARCHAR;

    vtail VARCHAR;
    vfm VARCHAR;

    vurrisset BOOLEAN DEFAULT FALSE;
    vGroupSeparator VARCHAR(2) DEFAULT NULL;
    vDecimalSeparator VARCHAR(2) DEFAULT NULL;
    vCurrencySymbol VARCHAR;
    vIsoCurrency VARCHAR;
    vDualCurrency VARCHAR;
    bd BOOLEAN DEFAULT FALSE;
    vln INTEGER;

BEGIN

    vDataType := UPPER(PG_TYPEOF(pVal)::TEXT);

    IF ARRAY_POSITION(cAllowedDatatypes,  vDataType) IS NULL THEN

        RAISE USING MESSAGE := verrorMessages[8];

    END IF;

    CASE
        WHEN vDataType IN
        (
            'INTERVAL',
            'TIMESTAMP WITHOUT TIME ZONE',
            'TIMESTAMP WITH TIME ZONE'
        ) THEN

            vIsDateTime := TRUE;

        WHEN vDataType IN
        (
            'REAL',
            'DOUBLE PRECISION',
            'NUMERIC',
            'INTEGER'
        ) THEN

            vIsNumeric := TRUE;

        ELSE

            vIsChar := TRUE; 

    END CASE;

    IF (vIsDateTime OR  (vIsNumeric AND pNoNumberFormat IS NULL)) AND (pFormat IS NULL OR pFormat = '') THEN

        IF vIsNumeric AND pFormat = '' THEN

            vResult := '#';
        
        ELSE

            vResult := NULL;

        END IF;

    ELSE

        CASE
            WHEN vIsDateTime AND vDataType <> 'INTERVAL' AND pFormat ~* '^FX$' THEN

                vResult := NULL;

            WHEN vIsDateTime THEN

                IF pNlsParam IS NOT NULL THEN

                    bd := TRUE;

                    vNlsParam := REPLACE(pNlsParam,' ', '');

                    SELECT STRING_AGG(TRIM(nls),'')
                    INTO vNlsParam
                    FROM  REGEXP_SPLIT_TO_TABLE
                    ( 
                        vNlsParam,
                        'NLS_',
                        'i'
                    ) nls
                    WHERE TRIM(nls) <> '' AND TRIM(nls) !~* 'CALENDAR';

                    IF vNlsParam IS NOT NULL THEN

                        IF vNlsParam  !~* 'DATE_LANGUAGE=' THEN

                            RAISE USING MESSAGE := verrorMessages[5];

                        END IF;

                        -- store original language
                        v_lctime := CURRENT_SETTING('lc_time');

                        vNlsParam := REGEXP_REPLACE(vNlsParam, 'DATE_LANGUAGE=', '', 'i');

                        -- try to set NLS
                        BEGIN

                            vTm := SET_CONFIG
                            (
                                'lc_time',
                                vNlsParam,
                                TRUE
                            );

                        EXCEPTION 
                            WHEN OTHERS THEN

                                RAISE USING MESSAGE := verrorMessages[5]; 
                        END;

                    END IF;

                END IF;

                IF NOT bd THEN

                    SELECT f.dmodelto
                    INTO vResult
                    FROM aws_oracle_data.dfmt f
                    WHERE f.dmodel = pFormat;

                    IF FOUND THEN

                        RETURN vResult;

                    END IF;

                END IF;
        
                vtail:= pFormat;

                LOOP

                    SELECT ok, tail, fm
                    INTO vFmt, vtail, vfm
                    FROM aws_oracle_ext.to_char_parser
                    (
                        pStr  => vtail,
                        pType => 'datetime',
                        pFm   => vfm
                    );

                    IF vFmt !~ '"' THEN

                        IF vDataType IN ('TIMESTAMP WITHOUT TIME ZONE', 'TIMESTAMP WITH TIME ZONE') THEN

                            IF vFmt ~* 'SP$' THEN

                                IF EXISTS (SELECT 1 FROM UNNEST(cpellmodels) t WHERE t = UPPER(vFmt)) THEN

                                    bd := TRUE;
                                    IF vDataType = 'TIMESTAMP WITH TIME ZONE' THEN

                                        vFmt := aws_oracle_ext.spell_timestamptz
                                        (
                                            pval => pVal,
                                            pfmt => vFmt
                                        );

                                    ELSE

                                        vFmt := aws_oracle_ext.spell_timestamp
                                        (
                                            pval => pVal,
                                            pfmt => vFmt
                                        );

                                    END IF;
                                    vFmt := CONCAT
                                    (
                                        '"',
                                        vFmt,
                                        '"'
                                    );

                                    vResult := CONCAT(vResult, vFmt);
                                    EXIT WHEN vtail IS NULL;
                                    CONTINUE;

                                END IF;

                            END IF;

                        END IF;

                        -- exact set of dates is chosen to be sure about day names
                        --calculate max day of week name length for language
                        IF vDataType <> 'INTERVAL' THEN

                            IF vFmt ~* '^tmMON$' OR vFmt ~* '^tmMONTH$' OR vFmt ~* '^tmDAY$' OR vFmt ~* '^tmDY$' THEN

                                bd := TRUE;

                                SELECT MAX(LENGTH(TO_CHAR(TO_DATE(CONCAT(LPAD(val::TEXT, 2, '0') , '102017'), 'ddmmyyyy'),'TMDAY'))),
                                            MAX(LENGTH(TO_CHAR(TO_DATE(CONCAT(LPAD(val::TEXT, 2, '0'), '102017'), 'ddmmyyyy'),'TMDY')))
                                INTO vDayMaxLengh,
                                    vDyMaxLengh
                                FROM UNNEST(cDayMonthNumbers) AS val
                                WHERE val BETWEEN 2 AND 8;

                                --calculate max month name length for language
                                SELECT MAX(LENGTH(TO_CHAR(TO_DATE(CONCAT(LPAD(val::TEXT, 2, '0'), '2017'), 'mmyyyy'),'TMMONTH'))),
                                    MAX(LENGTH(TO_CHAR(TO_DATE(CONCAT(LPAD(val::TEXT, 2, '0'), '2017'), 'mmyyyy'),'TMMON')))
                                INTO vMonthMaxLength,
                                    vMonMaxLength
                                FROM UNNEST(cDayMonthNumbers) AS val;

                            END IF;

                        END IF;

                        IF vDataType <> 'INTERVAL' THEN
    
                            FOR rec IN
                            (
                                SELECT fm.fmt
                                FROM aws_oracle_ext.format_models fm
                                WHERE fm.tp = 'datetime'
                                AND fm.grp = UPPER(SUBSTR(vFmt,1,1))
                                AND
                                (
                                    fm.fmt LIKE '%SP%' OR
                                    fm.fmt IN ('SYEAR', 'YEAR')
                                )
                            )
                            LOOP

                                
                                IF vFmt ~* CONCAT('^', rec.fmt, '$') THEN

                                    RAISE USING MESSAGE := verrorMessages[4];
                                
                                END IF;

                            END LOOP;


                            IF vFmt ~* '^E$' OR vFmt ~* '^EE$' THEN

                                RAISE USING MESSAGE := verrorMessages[3];

                            END IF;
                       
                        END IF;

                        IF vFmt ~* 'TZ[HM]' AND vDataType = 'TIMESTAMP WITHOUT TIME ZONE' THEN

                            FOR rec IN
                            (
                                SELECT fm.fmt
                                FROM aws_oracle_ext.format_models fm
                                WHERE fm.tp = 'datetime'
                                AND fm.grp = UPPER(SUBSTR(vFmt,1,1))
                                AND 
                                (
                                    fm.fmt LIKE 'TZH%' OR 
                                    fm.fmt LIKE 'TZM%'
                                )
                            )
                            LOOP

                                IF vFmt ~* CONCAT('^', rec.fmt) THEN

                                    RAISE USING MESSAGE := verrorMessages[2];

                                END IF;

                            END LOOP;

                        END IF;

                        IF vDataType <> 'INTERVAL' THEN
                        
                            IF vDataType = 'TIMESTAMP WITHOUT TIME ZONE' THEN

                                bd := TRUE;

                                vFmt := REGEXP_REPLACE(vFmt, 'tzr', '"+00:00"', 'ig');

                            END IF;

                            vFmt := REGEXP_REPLACE(vFmt, 'tzd', '', 'ig');

                            -- Unable to calculate TS correctly, will produce
                            -- Oracle behavior 9:01:01 AM
                            IF vFmt ~* 'TS' THEN

                                bd := TRUE;
                            
                                vFmt := REGEXP_REPLACE
                                (
                                    vFmt,
                                    'ts',
                                    CONCAT
                                    (
                                        '"',
                                        TRIM(TO_CHAR(pVal, 'hh'),'0'),
                                        ':',
                                        TO_CHAR(pVal, 'mi'),
                                        ':',
                                        TO_CHAR(pVal, 'ss'),
                                        ' ',
                                        TO_CHAR(pVal, 'AM'),
                                        '"'
                                    ),
                                    'ig'
                                );

                            END IF;

                            -- X will be .
                            IF vFmt !~* 'FX' AND vFmt ~* '^x' THEN

                                vFmt := REGEXP_REPLACE(vFmt, 'x', '.', 'ig');

                            END IF;

                            -- Fix cases
                            vFmt := REPLACE(vFmt, 'A.d.', 'A.D.');
                            vFmt := REPLACE(vFmt, 'A.m.', 'A.M.');
                            vFmt := REPLACE(vFmt, 'B.c.', 'B.C.');
                            vFmt := REPLACE(vFmt, 'P.m.', 'P.M.');

                            FOR rec IN
                            (
                                SELECT
                                    ARRAY_TO_STRING
                                    (
                                        REGEXP_MATCHES(vFmt, 'Rm|Ad|Bc|Pm|Am', 'g'),
                                        ''
                                    ) case_match
                            ) LOOP

                                vFmt := REPLACE
                                (
                                    vFmt,
                                    rec.case_match,
                                    CONCAT
                                    (
                                        '"',
                                        INITCAP(TO_CHAR(pVal, UPPER(rec.case_match))),
                                        '"'
                                    )
                                );

                                bd := TRUE;

                            END LOOP;

                            -- PG 13+ does not need THIS
                            -- PG has SSSS, but Oracle SSSSS, so we need to convert SSSSS to SSSS
                            -- ssss to ss + ss
                            IF NOT (current_setting('server_version_num')::int) >= 130000 THEN

                                IF vFmt ~* '^FMS{2}$' OR vFmt ~* '^S{2}$' THEN

                                    bd := TRUE;

                                    vFmt := CONCAT
                                    (
                                        '"',
                                        TO_CHAR(pVal, 'ss'),
                                        '"'
                                    );

                                END IF;

                                IF vFmt ~* '^FMS{5}$' OR vFmt ~* '^S{5}$' THEN

                                        bd := TRUE;

                                        vFmt := CONCAT
                                        (
                                            '"',
                                            TO_CHAR(pVal, REGEXP_REPLACE(vFmt, 's{5}', 'ssss', 'i')),
                                            '"'
                                        );

                                END IF;

                            END IF;

                            -- PG has ID, but Oracle use it as I + D, no ID
                            IF vFmt ~* '^i$' THEN
                                
                                bd := TRUE;

                                vFmt := 
                                    CONCAT
                                    (
                                        '"',
                                        TO_CHAR(pVal, 'I'),
                                        '"'
                                    );
                            
                            END IF;

                            /* PG unable to convert TH if contains lower case letters in model */
                            IF vFmt ~* 'TH' AND vFmt !~* 'MONTH' AND vFmt ~ '[[:lower:]]' THEN

                                bd := TRUE;

                                vFmt := CONCAT
                                (
                                    '"',
                                    REGEXP_REPLACE(TO_CHAR(pVal, vFmt), '(\d+)(\D+)', '\1', 'i'),
                                    LOWER(REGEXP_REPLACE(TO_CHAR(pVal, UPPER(vFmt)), '(\d+)(\D+)', '\2', 'i')),
                                    '"'
                                );
                            
                            END IF;

                            -- hard to calculate correct DS format, will set to fmmm/fmdd/fmyyyy
                            IF vFmt ~* 'ds' THEN

                                bd := TRUE;
                            
                                vFmt := REGEXP_REPLACE
                                (
                                    vFmt,
                                    'ds',
                                    CONCAT
                                    (
                                        '"',
                                        LTRIM(TO_CHAR(pVal, 'mm'), '0'),
                                        '/',
                                        LTRIM(TO_CHAR(pVal, 'dd'), '0'),
                                        '/',
                                        LTRIM(TO_CHAR(pVal, 'yyyy'), '0'), 
                                        '"'
                                    ),
                                    'ig'
                                );

                            END IF;

                            IF vFmt ~* 'SYYYY' THEN

                                bd := TRUE;
                            
                                vFmt := REGEXP_REPLACE
                                (
                                    vFmt,
                                    'syyyy',
                                    CONCAT
                                    (
                                        '"',
                                        CASE
                                            WHEN TO_CHAR(pVal,'BC') = 'BC' THEN
                                                CONCAT('-', TO_CHAR(pVal, 'YYYY'))
                                            ELSE
                                                CONCAT(' ', TO_CHAR(pVal, 'YYYY'))
                                        END,
                                        '"'
                                    ),
                                    'ig'
                                );

                            END IF;

                            IF vFmt ~* 'CC' AND vFmt !~* 'SCC' THEN

                                bd := TRUE;

                                vFmt := REGEXP_REPLACE
                                (
                                    vFmt,
                                    'cc',
                                    CONCAT
                                    (
                                        '"',
                                        CASE
                                            WHEN TO_CHAR(pVal,'BC') = 'BC' THEN
                                                REPLACE(TO_CHAR(pVal, 'CC'),'-','')
                                            ELSE
                                                TO_CHAR(pVal, 'CC')
                                        END,
                                        '"'
                                    ),
                                    'ig'
                                );

                            END IF;

                            IF vFmt ~* 'SCC' THEN

                                bd := TRUE;

                                vFmt := REGEXP_REPLACE
                                (
                                    vFmt,
                                    'scc',
                                    CONCAT
                                    (
                                        '"',
                                        CASE
                                            WHEN TO_CHAR(pVal,'BC') = 'BC' THEN
                                                TO_CHAR(pVal, 'CC')
                                            ELSE
                                                CONCAT(' ', TO_CHAR(pVal, 'CC'))
                                        END,
                                        '"'
                                    ),
                                    'ig'
                                );

                            END IF;

                            IF vFmt ~* 'TZH' THEN

                                bd := TRUE;

                                vFmt := REGEXP_REPLACE
                                (
                                    vFmt,
                                    'tzh',
                                    CONCAT
                                    (
                                        '"',
                                        SUBSTRING(EXTRACT(TIMEZONE_HOUR FROM pVal)::TEXT FROM '\D'),
                                        LPAD
                                        (
                                            SUBSTRING(EXTRACT(TIMEZONE_HOUR FROM pVal)::TEXT FROM '\d+'),
                                            2,
                                            '0'
                                        ),
                                        '"'
                                    ),
                                    'ig'
                                );

                            END IF;

                            IF vFmt ~* 'TZM' THEN

                                bd := TRUE;

                                vFmt := REGEXP_REPLACE
                                (
                                    vFmt,
                                    'tzm',
                                    CONCAT
                                    (
                                        '"',
                                        SUBSTRING(EXTRACT(TIMEZONE_MINUTES FROM pVal)::TEXT FROM '\D'),
                                        LPAD
                                        (
                                            SUBSTRING(EXTRACT(TIMEZONE_MINUTES FROM pVal)::TEXT FROM '\d+'),
                                            2,
                                            '0'
                                        ),
                                        '"'
                                    ),
                                    'ig'
                                );

                            END IF;

                            IF vFmt ~* 'TZR' THEN

                                bd := TRUE;

                                vFmt := REGEXP_REPLACE
                                (
                                    vFmt,
                                    'tzr',
                                    CONCAT
                                    (
                                        '"',
                                        SUBSTRING(EXTRACT(TIMEZONE_HOUR FROM pVal)::TEXT FROM '\D'),
                                        LPAD
                                        (
                                            SUBSTRING(EXTRACT(TIMEZONE_HOUR FROM pVal)::TEXT FROM '\d+'),
                                            2,
                                            '0'
                                        ),
                                        ':',
                                        SUBSTRING(EXTRACT(TIMEZONE_MINUTES FROM pVal)::TEXT FROM '\D'),
                                        LPAD
                                        (
                                            SUBSTRING(EXTRACT(TIMEZONE_MINUTES FROM pVal)::TEXT FROM '\d+'),
                                            2,
                                            '0'
                                        ),
                                        '"'
                                    ),
                                    'ig'
                                );

                            END IF;

                            -- hard to calculate correct DL, set to hardcoded format
                            IF vFmt ~* '^DL' THEN

                                bd := TRUE;

                                vFmt := 
                                    CONCAT
                                    (
                                        '"',
                                        TRIM(TO_CHAR(pVal, 'TMDay')),
                                        ', ',
                                        TRIM(TO_CHAR(pVal, 'TMMonth')),
                                        ' ',
                                        TO_CHAR(pVal, 'dd'),
                                        ', ',
                                        TO_CHAR(pVal, 'yyyy'),
                                        
                                        '"'
                                    );

                            END IF;

                            -- PG13+ does not need this
                            --FF[1..9] FF = FF6 here
                            IF NOT (current_setting('server_version_num')::int) >= 130000 THEN
                            
                                IF vFmt ~* '^FF\d' THEN

                                    bd := TRUE;

                                    vln := SUBSTRING(vFmt FROM '\d')::INTEGER;

                                    IF vln < 6 THEN

                                        vFmt := CONCAT('"', SUBSTR(TO_CHAR(pVal, 'US'), 1, vln), '"');

                                    ELSE

                                        vFmt := CONCAT('"', RPAD(TO_CHAR(pVal, 'US'), vln, '0'), '"');

                                    END IF;

                                END IF;

                            END IF;

                            IF vFmt ~* '^tmMON$' THEN

                                bd := TRUE;

                                vFmt := CONCAT
                                (
                                    '"',
                                    RPAD(TO_CHAR(pVal, vFmt), vMonMaxLength),
                                    '"'
                                );

                            END IF;

                            IF vFmt ~* '^tmMONTH$' THEN

                                bd := TRUE;

                                vFmt := CONCAT
                                (
                                    '"',
                                    RPAD(TO_CHAR(pVal, vFmt), vMonthMaxLength),
                                    '"'
                                );

                            END IF;

                            IF vFmt ~* '^tmDAY$' THEN

                                bd := TRUE;

                                vFmt := CONCAT
                                (
                                    '"',
                                    RPAD(TO_CHAR(pVal, vFmt), vDayMaxLengh),
                                    '"'
                                );

                            END IF;

                            IF vFmt ~* '^tmDY$' THEN

                                bd := TRUE;

                                vFmt := CONCAT
                                (
                                    '"',
                                    RPAD(TO_CHAR(pVal, vFmt), vDyMaxLengh),
                                    '"'
                                );

                            END IF;

                        END IF;

                    END IF;

                    IF vResult ~ 'Dd' THEN

                        vResult := REPLACE(vResult, 'Dd', 'dd');

                    END IF;

                    IF vResult ~ 'dD' THEN

                        vResult := REPLACE(vResult, 'dD', 'dd');

                    END IF;

                    vResult := CONCAT(vResult, vFmt);

                    EXIT WHEN vtail IS NULL;

                END LOOP;

                IF NOT bd THEN

                    INSERT INTO aws_oracle_data.dfmt
                    VALUES(pFormat, vResult)
                    ON CONFLICT ON CONSTRAINT dfmt_pkey DO NOTHING;

                END IF;

                -- restore language setting if they were changed
                IF CURRENT_SETTING('lc_time') <> v_lctime THEN

                    vTm := SET_CONFIG('lc_time', v_lctime, TRUE);

                END IF;

            WHEN vIsNumeric AND pNoNumberFormat IS NULL AND pNlsParam = '' THEN

                vResult := NULL;

            WHEN vIsNumeric THEN

                IF pNoNumberFormat IS NULL THEN

                    IF pNlsParam IS NOT NULL THEN

                        bd := TRUE;

                        SELECT STRING_AGG(CASE WHEN nls ~* 'CALENDAR' THEN '' ELSE nls END, '')
                        INTO vNlsParamCopy
                        FROM REGEXP_SPLIT_TO_TABLE
                        ( 
                            TRIM(E'\n\ ' FROM pNlsParam),
                            'NLS_',
                        'i') nls;

                        -- check if paramters are allowed
                        IF pNlsParam ~ '^\s+$' THEN

                            RAISE USING MESSAGE := verrorMessages[5];

                        END IF;

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

                            RAISE USING MESSAGE := verrorMessages[5];

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

                                RAISE USING MESSAGE := verrorMessages[5];

                            END IF;

                            vGroupSeparator := SUBSTR((rec.m)[2], 2, 1);

                            IF LENGTH(vGroupSeparator) = 0 THEN

                                RAISE USING MESSAGE := verrorMessages[5];

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

                                RAISE USING MESSAGE := verrorMessages[5];

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

                                RAISE USING MESSAGE := verrorMessages[5];

                            END IF;

                            SELECT icl.code
                            INTO vIsoCurrency
                            FROM aws_oracle_ext.iso_currency_list icl
                            WHERE icl.nls_iso_currency = (rec.m)[2];

                        END LOOP;

                    END IF;

                    IF NOT bd THEN

                        SELECT f.nmodel
                        INTO vFmt
                        FROM aws_oracle_data.nfmt f
                        WHERE f.nmodel = pFormat;

                        IF FOUND THEN

                            vResult := TO_CHAR
                            (
                                pVal,
                                REGEXP_REPLACE(vFmt, 'FM', 'FM', 'i')
                            );

                        IF vResult ~ '#' AND NOT pFormat ~* '[^09GD\.]' THEN

                                vResult := REPEAT('#', LENGTH(pFormat) + 1);

                        END IF;
                            
                        RETURN vResult;

                        END IF;

                    END IF;

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
                        
                    
                        vResult := CONCAT(vResult, vFmt);

                        EXIT WHEN vtail IS NULL;

                    END LOOP;

                    /* Restrictions */
                    --A comma element cannot begin a number format model
                    IF SUBSTR(vResult, 1, 1) = ',' THEN

                        RAISE USING MESSAGE := verrorMessages[6];

                    END IF;
                    -- A comma cannot appear to the right of a decimal
                    -- character or period in a number format model
                    CASE 
                        WHEN vResult ~* '[\.D].*\,' THEN

                            RAISE USING MESSAGE := verrorMessages[6];
                        --only one period in a number format model
                        WHEN vResult ~ '\..*\.' THEN

                            RAISE USING MESSAGE := verrorMessages[6];
                        -- only one decimal character in a number format model
                        WHEN vResult ~* 'd.*d' THEN

                            RAISE USING MESSAGE := verrorMessages[6];
                        -- group separator cannot appear to the right of a decimal 
                        -- character or period in a number format model
                        -- V also
                        WHEN vResult ~* '[\.DV].*g' THEN

                            RAISE USING MESSAGE := verrorMessages[6];
                        -- Start with g is not allowed
                        WHEN vResult ~* '^G' THEN

                            RAISE USING MESSAGE := verrorMessages[6];
                        -- It's not allowed to mix different type group and
                        -- decimal model symbols
                        WHEN vResult ~ '\.|\,' AND vResult ~* 'D|G' THEN

                            RAISE USING MESSAGE := verrorMessages[6];
                        -- The MI format element can appear only in the last position 
                        -- of a number format model
                        WHEN vResult ~* 'MI.+' THEN

                            RAISE USING MESSAGE := verrorMessages[6];
                        --The PR format element can appear only in the last position
                        -- of a number format model
                        WHEN vResult ~* 'PR.+' THEN

                            RAISE USING MESSAGE := verrorMessages[6];
                        -- The S format element can appear only in the first 
                        -- or last position of a number format model
                        WHEN vResult ~* '[^S]+S[^S]+' OR vResult ~* 'S[^S]*S' THEN

                            RAISE USING MESSAGE := verrorMessages[6];
                        -- You cannot precede this element with any other element
                        WHEN vResult ~* '.+TM' THEN

                            RAISE USING MESSAGE := verrorMessages[6];
                        -- You can follow this element only with one 9 or 
                        -- one E (or e), but not with any combination of these
                        WHEN vResult ~* 'TM.{2,}' THEN

                            RAISE USING MESSAGE := verrorMessages[6];
                        WHEN vResult ~* 'TM[^9e]' THEN

                            RAISE USING MESSAGE := verrorMessages[6];
                        -- You can precede this element only with 0 (which returns leading zeroes)
                        -- or FM. Any other elements return an error
                        WHEN vResult ~* '.*X.?'
                            AND vResult !~* '^0+X{1,}$'
                            AND vResult !~* '^FMX{1,}$'
                            AND vResult !~* '^FM0{1,}X{1,}$'
                            AND vResult !~* '^X{1,}$' THEN

                                RAISE USING MESSAGE := verrorMessages[6];
                        -- only one $ allowed
                        WHEN vResult ~ '\$.*\$' THEN

                            RAISE USING MESSAGE := verrorMessages[6];
                        -- only one C allowed
                        WHEN vResult ~* 'C.*C' THEN

                            RAISE USING MESSAGE := verrorMessages[6];
                        -- only one L allowed
                        WHEN vResult ~* 'L.*L' THEN

                            RAISE USING MESSAGE := verrorMessages[6];
                        -- only one U allowed
                        WHEN vResult ~* 'U.*U' THEN

                            RAISE USING MESSAGE := verrorMessages[6];
                        -- C, L, $, U together is not allowed
                        WHEN vResult ~* 'C.*[\$LU]' THEN

                            RAISE USING MESSAGE := verrorMessages[6];
                        WHEN vResult ~* '[UL\$].*C' THEN

                            RAISE USING MESSAGE := verrorMessages[6];
                        -- only one V allowed
                        WHEN vResult ~* 'V.*V' THEN

                            RAISE USING MESSAGE := verrorMessages[6];
                        -- V and period or decimal is not allowed
                        WHEN vResult ~* 'V.*[\.D]' OR vResult ~* '[\.D].*V' THEN

                            RAISE USING MESSAGE := verrorMessages[6];
                        -- If RN - no other models allowed
                        WHEN vResult ~* '.+RN' OR vResult ~* 'RN.+' THEN

                            RAISE USING MESSAGE := verrorMessages[6];
                        -- Only EEEE is not allowed. No chars after EEEE. No comma before EEEE
                        WHEN vResult ~* '^EEEE$' 
                            OR vResult ~* 'EEEE[^S]+' 
                            OR vResult ~* '\,.*EEEE'
                            OR vResult ~* 'EEEE.{2,}' THEN

                                RAISE USING MESSAGE := verrorMessages[6];
                        ELSE

                            NULL;
                    END CASE;

                    /* Some Oracle actions repeated */
                    IF UPPER(vResult) = 'S' THEN

                        bd := TRUE;

                        vResult := '#';

                    END IF;

                    IF vResult ~* 'U|C|L' THEN

                        bd := TRUE;

                        IF vResult ~* 'U' THEN

                            IF vDualCurrency IS NULL THEN

                                SELECT value
                                INTO vDualCurrency
                                FROM aws_oracle_ext.v$nls_parameters WHERE parameter = 'NLS_DUAL_CURRENCY';

                            END IF;

                            vResult := REGEXP_REPLACE(vResult, 'U',  CONCAT('"', vDualCurrency, '"') , 'i');
                            vurrisset := true;

                        END IF;

                        IF vResult ~* 'C' AND NOT vurrisset THEN

                            IF vIsoCurrency IS NULL THEN

                                SELECT icl.code
                                INTO vIsoCurrency
                                FROM aws_oracle_ext.iso_currency_list icl
                                WHERE icl.nls_iso_currency = (SELECT value
                                FROM aws_oracle_ext.v$nls_parameters WHERE parameter = 'NLS_ISO_CURRENCY');

                            END IF;

                            vResult := REGEXP_REPLACE(vResult, 'C',  CONCAT('"', vIsoCurrency, '"') , 'i');
                            vurrisset := true;

                        END IF;

                        IF vResult ~* 'L' AND NOT vurrisset THEN

                            IF vCurrencySymbol IS NULL THEN

                                SELECT value
                                INTO vCurrencySymbol
                                FROM aws_oracle_ext.v$nls_parameters
                                WHERE parameter = 'NLS_CURRENCY';

                            END IF;

                            vResult := REGEXP_REPLACE(vResult, 'L',  CONCAT('"', vCurrencySymbol, '"') , 'i');
                            vurrisset := true;

                        END IF;

                    END IF;

                    IF vResult ~ '\$' AND vResult !~ '"\$"' THEN

                        bd := TRUE;

                        vResult := CONCAT('"$"', REPLACE(vResult, '$', ''));

                    END IF;

                    IF vResult ~* 'TMe' THEN

                        vResult = REGEXP_REPLACE(vResult, 'TMe', '9.9EEEE', 'i');

                    END IF;

                    -- converting

                    CASE
                        WHEN vResult ~* 'X' AND vResult !~ '"' THEN

                            bd := TRUE;
                            
                            vResult := CONCAT
                            (
                                CASE
                                    WHEN vResult ~* 'FM' THEN
                                        ''
                                    ELSE
                                        ' '
                                    END,
                                LPAD
                                (
                                    CASE
                                        WHEN vResult ~ 'X' THEN
                                            UPPER(TO_HEX(ROUND(pVal,0)::INTEGER)::TEXT)
                                        ELSE TO_HEX(ROUND(pVal,0)::INTEGER)::TEXT
                                    END,
                                    LENGTH
                                    (
                                        REGEXP_REPLACE
                                        (
                                            vResult,
                                            'FM',
                                            '',
                                            'i'
                                        )
                                    ),
                                    '0'
                                )
                            );
                            
                        WHEN vResult ~* 'EEEE' THEN

                            bd := TRUE;

                            vResult := 
                            CASE 
                                WHEN vResult ~* 'FM' THEN 
                                    LTRIM
                                    (
                                        REPLACE
                                        (
                                            REGEXP_REPLACE
                                            (
                                                TO_CHAR
                                                (
                                                    pVal,
                                                    REGEXP_REPLACE(vResult, 'FM', '', 'i')
                                                ),
                                                '00(\d)',
                                                '0\1'
                                            ),
                                            'e',
                                            'E'
                                        )
                                    )
                                ELSE
                                    CONCAT(' ', REPLACE(REGEXP_REPLACE(TO_CHAR(pVal, vResult), '00(\d)', '0\1'), 'e', 'E'))
                            END;

                            IF vDecimalSeparator IS NOT NULL THEN

                                vFmt := REPLACE(TO_CHAR(1.1, 'FM9D9'),'1','');
                                vResult := REPLACE(vResult, vFmt, '#.');    
                                vResult := REPLACE(vResult, '#.', vDecimalSeparator);

                            END IF;

                        WHEN vResult ~* 'G|D' AND vDecimalSeparator IS NOT NULL AND vGroupSeparator IS NOT NULL THEN

                            bd := TRUE;
                            vResult := TO_CHAR(pVal, REGEXP_REPLACE(vResult, 'FM', 'FM', 'i'));

                            vFmt := REPLACE(TO_CHAR(1.1, 'FM9D9'),'1','');
                            vResult := REPLACE(vResult, vFmt, '#.');
                            vFmt := REPLACE(TO_CHAR(1111, 'FM9G999'),'1','');
                            vResult := REPLACE(vResult, vFmt, '#,');

                            vResult := REPLACE(vResult, '#,', vGroupSeparator);
                            vResult := REPLACE(vResult, '#.', vDecimalSeparator);
                        
                        --  case with format = '.999'  
                        WHEN vResult ~* '^\.(?=\d+$)' THEN  

                            bd := TRUE;
                            
                            vResult :=
                            REGEXP_REPLACE
                            (
                                TO_CHAR
                                    (
                                        pVal,
                                        REGEXP_REPLACE
                                        (
                                            vResult, 
                                            '^\.(?=\d+$)', 
                                            '0.', 
                                            'g'
                                        )
                                    ),
                                '^\ ?0\.',
                                ' .',
                                'g'
                            );
                        WHEN vResult ~* 'TM9?' THEN

                            vResult := pVal::TEXT;

                            IF vDecimalSeparator IS NOT NULL THEN

                                vResult := REPLACE(vResult, '.', vDecimalSeparator);

                            END IF;

						ELSE

                            vResult := TO_CHAR
                            (
                                pVal,
                                REGEXP_REPLACE(vResult, 'FM', 'FM', 'i')
                            );

                            IF vResult ~ '#' AND NOT pFormat ~* '[^09GD\.]' THEN

                                bd := TRUE;

                                vResult := REPEAT('#', LENGTH(pFormat) + 1);

                            END IF;

                            IF NOT bd THEN

                                INSERT INTO aws_oracle_data.nfmt
                                VALUES (pFormat)
                                ON CONFLICT ON CONSTRAINT nfmt_pkey DO NOTHING;

                            END IF;

                    END CASE;
                
                ELSE

                        IF pVal = 0 THEN

                            vResult := '0';
                            
                        ELSE

                            vResult := REGEXP_REPLACE(REGEXP_REPLACE(REGEXP_REPLACE(pVal::TEXT, '^0\.(\d+)', '.\1'), '\.0{2,}$', ''), '\.$', '');

                            vResult := REGEXP_REPLACE(vResult, '^-0\.(\d+)', '-.\1');

                            IF vResult ~ '\.' THEN

                                vResult := REGEXP_REPLACE(REGEXP_REPLACE(vResult, '0+$', ''), '\.$', '');

                            END IF;
                        
                        END IF;

                END IF;
                
            ELSE

                IF pFormat IS NOT NULL THEN
                    
                    RAISE USING MESSAGE := verrorMessages[1];

                END IF;
                
                IF LENGTH(pVal) > 4000 THEN

                    RAISE USING MESSAGE := verrorMessages[7];

                END IF;

                vResult := pVal::VARCHAR;

        END CASE;

    END IF;

    RETURN vResult;

END;

$BODY$;
