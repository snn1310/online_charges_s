CREATE OR REPLACE FUNCTION aws_oracle_ext.utl_file$fhstorage()
RETURNS VOID
AS
$BODY$
BEGIN
    CREATE TEMPORARY TABLE IF NOT EXISTS aws$utl_file_files
    (
        id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        open_mode TEXT NOT NULL,
        directory_name TEXT NOT NULL,
        open_filename TEXT NOT NULL,
        max_linesize SMALLINT NOT NULL,
        fpos BIGINT NOT NULL DEFAULT 0,
        text_contents TEXT,
        CONSTRAINT uk_directory_file UNIQUE(directory_name, open_filename)
    );
END;
$BODY$
LANGUAGE plpgsql;
