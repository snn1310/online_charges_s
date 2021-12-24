CREATE OR REPLACE FUNCTION aws_oracle_ext.utl_file$fclose_all()
RETURNS VOID
AS
$BODY$
BEGIN

    TRUNCATE TABLE aws$utl_file_files;

END;
$BODY$
LANGUAGE plpgsql;