CREATE OR REPLACE FUNCTION aws_oracle_ext.get_extpack_variable
(
    IN variable_name TEXT,
    IN missing_ok BOOLEAN DEFAULT TRUE
)
RETURNS TEXT
AS
$BODY$
BEGIN

    RETURN aws_oracle_ext.get_package_variable
    (
        variable_name => get_extpack_variable.variable_name
    );
   
EXCEPTION 
    WHEN OTHERS THEN

        IF missing_ok THEN
        
            RETURN NULL;

        ELSE

            RAISE;

        END IF;

END;
$BODY$
LANGUAGE plpgsql;