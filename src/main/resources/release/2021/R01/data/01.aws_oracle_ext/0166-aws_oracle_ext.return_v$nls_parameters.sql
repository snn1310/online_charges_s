CREATE OR REPLACE FUNCTION aws_oracle_ext.return_v$nls_parameters()
RETURNS SETOF aws_oracle_ext.nls_param
AS
$BODY$
DECLARE
    ret aws_oracle_ext.nls_param;
    vjsonrow JSON;
BEGIN
    PERFORM aws_oracle_ext.nls_parameters_init();

    WITH by_default AS
    (
        SELECT params_dictionary ->> 'NLS_CALENDAR' AS NLS_CALENDAR,
            params_dictionary ->> 'NLS_CHARACTERSET' AS NLS_CHARACTERSET,
            params_dictionary ->> 'NLS_COMP' AS NLS_COMP,
            params_dictionary ->> 'NLS_CURRENCY' AS NLS_CURRENCY,
            params_dictionary ->> 'NLS_DATE_FORMAT' AS NLS_DATE_FORMAT,
            params_dictionary ->> 'NLS_DATE_LANGUAGE' AS NLS_DATE_LANGUAGE,
            params_dictionary ->> 'NLS_DUAL_CURRENCY' AS NLS_DUAL_CURRENCY,
            params_dictionary ->> 'NLS_ISO_CURRENCY' AS NLS_ISO_CURRENCY,
            params_dictionary ->> 'NLS_LANGUAGE' AS NLS_LANGUAGE,
            params_dictionary ->> 'NLS_LENGTH_SEMANTICS' AS NLS_LENGTH_SEMANTICS,
            params_dictionary ->> 'NLS_NCHAR_CHARACTERSET' AS NLS_NCHAR_CHARACTERSET,
            params_dictionary ->> 'NLS_NCHAR_CONV_EXCP' AS NLS_NCHAR_CONV_EXCP,
            params_dictionary ->> 'NLS_NUMERIC_CHARACTERS' AS NLS_NUMERIC_CHARACTERS,
            params_dictionary ->> 'NLS_SORT' AS NLS_SORT,
            params_dictionary ->> 'NLS_TERRITORY' AS NLS_TERRITORY,
            params_dictionary ->> 'NLS_TIMESTAMP_FORMAT' AS NLS_TIMESTAMP_FORMAT,
            params_dictionary ->> 'NLS_TIMESTAMP_TZ_FORMAT' AS NLS_TIMESTAMP_TZ_FORMAT,
            params_dictionary ->> 'NLS_TIME_FORMAT' AS nls_time_format,
            params_dictionary ->> 'NLS_TIME_TZ_FORMAT' AS nls_time_tz_format
        FROM aws_oracle_ext.nls_parameters
        WHERE nls_territory ='AMERICA'
    ),
    cur_nls as
    (
        SELECT params_dictionary ->> 'NLS_CALENDAR' AS NLS_CALENDAR,
            params_dictionary ->> 'NLS_CHARACTERSET' AS NLS_CHARACTERSET,
            params_dictionary ->> 'NLS_COMP' AS NLS_COMP,
            params_dictionary ->> 'NLS_CURRENCY' AS NLS_CURRENCY,
            params_dictionary ->> 'NLS_DATE_FORMAT' AS NLS_DATE_FORMAT,
            params_dictionary ->> 'NLS_DATE_LANGUAGE' AS NLS_DATE_LANGUAGE,
            params_dictionary ->> 'NLS_DUAL_CURRENCY' AS NLS_DUAL_CURRENCY,
            params_dictionary ->> 'NLS_ISO_CURRENCY' AS NLS_ISO_CURRENCY,
            params_dictionary ->> 'NLS_LANGUAGE' AS NLS_LANGUAGE,
            params_dictionary ->> 'NLS_LENGTH_SEMANTICS' AS NLS_LENGTH_SEMANTICS,
            params_dictionary ->> 'NLS_NCHAR_CHARACTERSET' AS NLS_NCHAR_CHARACTERSET,
            params_dictionary ->> 'NLS_NCHAR_CONV_EXCP' AS NLS_NCHAR_CONV_EXCP,
            params_dictionary ->> 'NLS_NUMERIC_CHARACTERS' AS NLS_NUMERIC_CHARACTERS,
            params_dictionary ->> 'NLS_SORT' AS NLS_SORT,
            params_dictionary ->> 'NLS_TERRITORY' AS NLS_TERRITORY,
            params_dictionary ->> 'NLS_TIMESTAMP_FORMAT' AS NLS_TIMESTAMP_FORMAT,
            params_dictionary ->> 'NLS_TIMESTAMP_TZ_FORMAT' AS NLS_TIMESTAMP_TZ_FORMAT,
            params_dictionary ->> 'NLS_TIME_FORMAT' AS nls_time_format,
            params_dictionary ->> 'NLS_TIME_TZ_FORMAT' AS nls_time_tz_format
        FROM aws_oracle_ext.nls_parameters
        WHERE nls_territory = aws_oracle_ext.get_package_variable(variable_name => 'NLS_TERRITORY')
    ), vals as
    (
    SELECT COALESCE(aws_oracle_ext.get_package_variable(variable_name => 'NLS_CALENDAR'), cn.nls_calendar, bd.nls_calendar) AS nls_calendar,
        COALESCE(aws_oracle_ext.get_extpack_variable(variable_name => 'NLS_CHARACTERSET'), cn.nls_characterset, bd.nls_characterset) AS nls_characterset,
        COALESCE(aws_oracle_ext.get_extpack_variable(variable_name => 'NLS_COMP'), cn.nls_comp, bd.nls_comp) AS nls_comp,
        COALESCE(aws_oracle_ext.get_extpack_variable(variable_name => 'NLS_CURRENCY'), cn.nls_currency, bd.nls_currency) AS nls_currency,
        COALESCE(aws_oracle_ext.get_extpack_variable(variable_name => 'NLS_DATE_FORMAT'), cn.nls_date_format, bd.nls_date_format) AS nls_date_format,
        COALESCE(aws_oracle_ext.get_extpack_variable(variable_name => 'NLS_DATE_LANGUAGE'), cn.nls_date_language, bd.nls_date_language) AS nls_date_language,
        COALESCE(aws_oracle_ext.get_extpack_variable(variable_name => 'NLS_DUAL_CURRENCY'), cn.nls_dual_currency, bd.nls_dual_currency) AS nls_dual_currency,
        COALESCE(aws_oracle_ext.get_extpack_variable(variable_name => 'NLS_ISO_CURRENCY'), cn.nls_iso_currency, bd.nls_iso_currency) AS nls_iso_currency,
        COALESCE(aws_oracle_ext.get_extpack_variable(variable_name => 'NLS_LANGUAGE'), cn.nls_language, bd.nls_language) AS nls_language,
        COALESCE(aws_oracle_ext.get_extpack_variable(variable_name => 'NLS_LENGTH_SEMANTICS'), cn.nls_length_semantics, bd.nls_length_semantics) AS nls_length_semantics,
        COALESCE(aws_oracle_ext.get_extpack_variable(variable_name => 'NLS_NCHAR_CHARACTERSET'), cn.nls_nchar_characterset, bd.nls_nchar_characterset) AS nls_nchar_characterset,
        COALESCE(aws_oracle_ext.get_extpack_variable(variable_name => 'NLS_NCHAR_CONV_EXCP'), cn.nls_nchar_conv_excp, bd.nls_nchar_conv_excp) AS nls_nchar_conv_excp,
        COALESCE(aws_oracle_ext.get_extpack_variable(variable_name => 'NLS_NUMERIC_CHARACTERS'), cn.nls_numeric_characters, bd.nls_numeric_characters) AS nls_numeric_characters,
        COALESCE(aws_oracle_ext.get_extpack_variable(variable_name => 'NLS_SORT'), cn.nls_sort, bd.nls_sort) AS nls_sort,
        COALESCE(aws_oracle_ext.get_extpack_variable(variable_name => 'NLS_TERRITORY'), cn.nls_territory, bd.nls_territory) AS nls_territory,
        COALESCE(aws_oracle_ext.get_extpack_variable(variable_name => 'NLS_TIMESTAMP_FORMAT'), cn.nls_timestamp_format, bd.nls_timestamp_format) AS nls_timestamp_format,
        COALESCE(aws_oracle_ext.get_extpack_variable(variable_name => 'NLS_TIMESTAMP_TZ_FORMAT'), cn.nls_timestamp_tz_format, bd.nls_timestamp_tz_format) AS nls_timestamp_tz_format,
        COALESCE(aws_oracle_ext.get_extpack_variable(variable_name => 'NLS_TIME_FORMAT'), cn.nls_time_format, bd.nls_time_format) AS nls_time_format,
        COALESCE(aws_oracle_ext.get_extpack_variable(variable_name => 'NLS_TIME_TZ_FORMAT'), cn.nls_time_tz_format, bd.nls_time_tz_format) AS nls_time_tz_format
    FROM by_default bd
    LEFT JOIN cur_nls cn ON 1=1
    )
    SELECT ROW_TO_JSON(vals)
    INTO vjsonrow
    FROM vals;

    FOR ret IN
    SELECT UPPER(parameter),
        value,
        0 AS con_id
    FROM json_each_text(vjsonrow) AS t(parameter, value)
    LOOP

        RETURN NEXT ret;

    END LOOP;


END;
$BODY$
LANGUAGE plpgsql;