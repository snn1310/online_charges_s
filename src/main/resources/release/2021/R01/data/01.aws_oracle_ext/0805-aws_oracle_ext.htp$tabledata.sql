CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$tableData
(
    cvalue      IN TEXT DEFAULT NULL,
    calign      IN TEXT DEFAULT NULL,
    cdp         IN TEXT DEFAULT NULL,
    cnowrap     IN TEXT DEFAULT NULL,
    crowspan    IN TEXT DEFAULT NULL,
    ccolspan    IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
)
RETURNS VOID AS
$BODY$
BEGIN

    PERFORM aws_oracle_ext.htp$p(aws_oracle_ext.htf$tableData(cvalue,calign,cdp,cnowrap,crowspan,ccolspan,cattributes));

END;
$BODY$
LANGUAGE plpgsql;


