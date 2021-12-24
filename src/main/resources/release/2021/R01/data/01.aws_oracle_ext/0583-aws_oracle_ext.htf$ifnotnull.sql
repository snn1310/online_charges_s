CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$ifnotnull
(
    str1  IN       TEXT,
    str2  IN        TEXT
)
RETURNS TEXT AS
$BODY$
    SELECT case when str1 is null then null
		            else str2
		       end;
$BODY$
LANGUAGE SQL
IMMUTABLE;