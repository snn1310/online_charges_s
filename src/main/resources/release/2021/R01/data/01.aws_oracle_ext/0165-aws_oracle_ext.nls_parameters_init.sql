CREATE OR REPLACE FUNCTION aws_oracle_ext.nls_parameters_init
(
    IN pterritory TEXT DEFAULT NULL,
    IN precalc BOOLEAN DEFAULT FALSE
)
RETURNS VOID
LANGUAGE plpgsql
AS 
$BODY$
DECLARE
    vNlsTerritory TEXT;
    vctype TEXT;
    rec RECORD;
    vrecalc BOOLEAN DEFAULT FALSE;
BEGIN
    
    IF precalc THEN

        vrecalc := TRUE;

    ELSE

        vrecalc := CASE WHEN COALESCE(UPPER(aws_oracle_ext.get_extpack_variable(variable_name => 'RECALCNLS', missing_ok => TRUE)), 'TRUE') <> 'TRUE' THEN FALSE ELSE TRUE END;

    END IF;
    
    IF vrecalc THEN

        IF pterritory IS NULL THEN

            SELECT SPLIT_PART(pd.datctype::TEXT, '.', 1)
            INTO vctype
            FROM pg_database pd
            WHERE pd.datname = CURRENT_DATABASE();

            SELECT ap.nls_territory
            INTO vNlsTerritory
            FROM aws_oracle_ext.nls_parameters ap
            WHERE ap.pg_territory_ux = vctype
            ORDER BY 1
            LIMIT 1;

            IF NOT FOUND THEN

                vNlsTerritory := 'AMERICA';

            END IF;
        ELSE

            SELECT ap.nls_territory
            INTO vNlsTerritory
            FROM aws_oracle_ext.nls_parameters ap
            WHERE ap.nls_territory = pterritory;

            IF NOT FOUND THEN

                vNlsTerritory := 'AMERICA';

            END IF;

        END IF;
        
        FOR rec IN
        (
            SELECT anp.nls_territory,
                anp.params_dictionary ->> 'NLS_CURRENCY' AS NLS_CURRENCY,
                anp.params_dictionary ->> 'NLS_ISO_CURRENCY' AS NLS_ISO_CURRENCY,
                anp.params_dictionary ->> 'NLS_DATE_FORMAT' AS NLS_DATE_FORMAT,
                anp.params_dictionary ->> 'NLS_DUAL_CURRENCY' AS NLS_DUAL_CURRENCY,
                anp.params_dictionary ->> 'NLS_NUMERIC_CHARACTERS' AS NLS_NUMERIC_CHARACTERS,
                anp.params_dictionary ->> 'NLS_CALENDAR' AS nls_calendar,
                anp.params_dictionary ->> 'NLS_CHARACTERSET' AS nls_characterset,
                anp.params_dictionary ->> 'NLS_COMP' AS nls_comp,
                anp.params_dictionary ->> 'NLS_DATE_LANGUAGE' AS nls_date_language,
                anp.params_dictionary ->> 'NLS_LANGUAGE' AS nls_language,
                anp.params_dictionary ->> 'NLS_LENGTH_SEMANTICS' AS nls_length_semantics,
                anp.params_dictionary ->> 'NLS_NCHAR_CHARACTERSET' AS nls_nchar_characterset,
                anp.params_dictionary ->> 'NLS_NCHAR_CONV_EXCP' AS nls_nchar_conv_excp,
                anp.params_dictionary ->> 'NLS_SORT' AS nls_sort,
                anp.params_dictionary ->> 'NLS_TERRITORY' AS nls_territory,
                anp.params_dictionary ->> 'NLS_TIMESTAMP_FORMAT' AS nls_timestamp_format,
                anp.params_dictionary ->> 'NLS_TIMESTAMP_TZ_FORMAT' AS nls_timestamp_tz_format,
                anp.params_dictionary ->> 'NLS_TIME_FORMAT' AS nls_time_format,
                anp.params_dictionary ->> 'NLS_TIME_TZ_FORMAT' AS nls_time_tz_format

            FROM aws_oracle_ext.nls_parameters anp
            WHERE anp.nls_territory = vNlsTerritory
        )
        LOOP

            PERFORM aws_oracle_ext.set_package_variable
            (
                variable_name => 'NLS_TERRITORY',
                variable_value => rec.nls_territory::TEXT
            );

            PERFORM aws_oracle_ext.set_package_variable
            (
                variable_name => 'NLS_CURRENCY',
                variable_value => rec.nls_currency::TEXT
            );

            PERFORM aws_oracle_ext.set_package_variable
            (
                variable_name => 'NLS_ISO_CURRENCY',
                variable_value => rec.nls_iso_currency::TEXT
            );
            
            PERFORM aws_oracle_ext.set_package_variable
            (
                variable_name => 'NLS_DATE_FORMAT',
                variable_value => rec.nls_date_format::TEXT
            );

            PERFORM aws_oracle_ext.set_package_variable
            (
                variable_name => 'NLS_DUAL_CURRENCY',
                variable_value => rec.nls_dual_currency::TEXT
            );

            PERFORM aws_oracle_ext.set_package_variable
            (
                variable_name => 'NLS_NUMERIC_CHARACTERS',
                variable_value => rec.nls_numeric_characters::TEXT
            );

            PERFORM aws_oracle_ext.set_package_variable
            (
                variable_name => 'NLS_CALENDAR',
                variable_value => rec.nls_calendar
            );

            PERFORM aws_oracle_ext.set_package_variable
            (
                variable_name => 'NLS_CHARACTERSET',
                variable_value => rec.nls_characterset
            );

            PERFORM aws_oracle_ext.set_package_variable
            (
                variable_name => 'NLS_COMP',
                variable_value => rec.nls_comp
            );

            PERFORM aws_oracle_ext.set_package_variable
            (
                variable_name => 'NLS_DATE_LANGUAGE',
                variable_value => rec.nls_date_language
            );

            PERFORM aws_oracle_ext.set_package_variable
            (
                variable_name => 'NLS_LANGUAGE',
                variable_value => rec.nls_language
            );

            PERFORM aws_oracle_ext.set_package_variable
            (
                variable_name => 'NLS_LENGTH_SEMANTICS',
                variable_value => rec.nls_length_semantics
            );

            PERFORM aws_oracle_ext.set_package_variable
            (
                variable_name => 'NLS_NCHAR_CHARACTERSET',
                variable_value => rec.nls_nchar_characterset
            );

            PERFORM aws_oracle_ext.set_package_variable
            (
                variable_name => 'NLS_NCHAR_CONV_EXCP',
                variable_value => rec.nls_nchar_conv_excp
            );

            PERFORM aws_oracle_ext.set_package_variable
            (
                variable_name => 'NLS_SORT',
                variable_value => rec.nls_sort
            );
            
            PERFORM aws_oracle_ext.set_package_variable
            (
                variable_name => 'NLS_TERRITORY',
                variable_value => rec.nls_territory
            );

            PERFORM aws_oracle_ext.set_package_variable
            (
                variable_name => 'NLS_TIMESTAMP_FORMAT',
                variable_value => rec.nls_timestamp_format
            );

            PERFORM aws_oracle_ext.set_package_variable
            (
                variable_name => 'NLS_TIMESTAMP_TZ_FORMAT',
                variable_value => rec.nls_timestamp_tz_format
            );

            PERFORM aws_oracle_ext.set_package_variable
            (
                variable_name => 'NLS_TIME_FORMAT',
                variable_value => rec.nls_timestamp_tz_format
            );

            PERFORM aws_oracle_ext.set_package_variable
            (
                variable_name => 'NLS_TIME_TZ_FORMAT',
                variable_value => rec.nls_timestamp_tz_format
            );

        END LOOP;

    PERFORM aws_oracle_ext.set_package_variable
    (
        variable_name => 'RECALCNLS',
        variable_value => FALSE::TEXT
    );

    END IF;

END;

$BODY$;
