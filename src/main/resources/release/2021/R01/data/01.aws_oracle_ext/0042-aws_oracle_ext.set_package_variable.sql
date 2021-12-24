CREATE OR REPLACE FUNCTION aws_oracle_ext.set_package_variable
(
    IN schema_name TEXT DEFAULT 'AWS_ORACLE_EXT',
    IN package_name TEXT DEFAULT 'AWS_ORACLE_ENV',
    IN variable_name TEXT DEFAULT '',
    IN variable_value ANYELEMENT DEFAULT NULL::TEXT
)
RETURNS VOID
AS
$BODY$
DECLARE
    vschema_name TEXT := schema_name;
    vpackage_name TEXT := package_name;
BEGIN

    IF COALESCE(schema_name, 'AWS_ORACLE_EXT') <> 'AWS_ORACLE_EXT' AND

        COALESCE(package_name, 'AWS_ORACLE_ENV') <> 'AWS_ORACLE_ENV' THEN

        vschema_name := aws_oracle_ext.check_identifier_case(schema_name);
        vpackage_name := aws_oracle_ext.check_identifier_case(package_name);
    
        IF aws_oracle_ext.check_identifier_case(variable_name) <> 'init$$' THEN
        
            EXECUTE CONCAT
            (
                'SELECT ',
                schema_name,
                '.',
                package_name,
                '$Init()'
            );
    
        END IF;

    END IF;
    
    PERFORM aws_oracle_ext.set_package_variable_v8
    (
        sn => vschema_name,
        pn => vpackage_name,
        vn => aws_oracle_ext.check_identifier_case(variable_name),
        vv => variable_value::TEXT
    );

END;
$BODY$
LANGUAGE plpgsql;