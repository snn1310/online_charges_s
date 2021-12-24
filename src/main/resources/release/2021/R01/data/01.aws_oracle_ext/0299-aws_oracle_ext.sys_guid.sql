CREATE OR REPLACE FUNCTION aws_oracle_ext.sys_guid()
RETURNS TEXT
AS
$BODY$
BEGIN
    IF (NOT aws_oracle_ext.is_package_initialized('SYS_GUID', 'INITIALIZE')) THEN
        CREATE EXTENSION IF NOT EXISTS pgcrypto SCHEMA public;

        PERFORM aws_oracle_ext.set_package_initialized('SYS_GUID', 'INITIALIZE');
    END IF;

    RETURN upper(replace(public.gen_random_uuid()::TEXT, '-', ''));
END;
$BODY$
LANGUAGE plpgsql
VOLATILE;