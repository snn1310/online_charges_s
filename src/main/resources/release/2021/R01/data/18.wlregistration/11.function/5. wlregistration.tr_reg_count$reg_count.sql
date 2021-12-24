CREATE OR REPLACE FUNCTION wlregistration.tr_reg_count$reg_count()
RETURNS trigger
AS
$BODY$
BEGIN
    IF SESSION_USER ^= 'GGS' THEN
        new.modified_by := aws_oracle_ext.SYS_CONTEXT('USERENV', 'OS_USER');
        new.mod_timestamp := (CLOCK_TIMESTAMP() AT TIME ZONE COALESCE(CURRENT_SETTING('aws_oracle_ext.tz', TRUE), 'GMT'))::TIMESTAMP(0);
    END IF;

    IF TG_OP = 'INSERT' THEN
        RETURN NEW;
    ELSIF TG_OP = 'UPDATE' THEN
        RETURN NEW;
    END IF;
END;
$BODY$
LANGUAGE  plpgsql;

