CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$format_cell
(
    columnValue IN TEXT,
    format_numbers IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$
begin

   if format_numers is null then
      return aws_oracle_ext.htf$tableData(columnValue);
   end if;

   return aws_oracle_ext.htf$tableData(coalesce(ltrim(aws_oracle_ext.to_char(aws_oracle_ext.to_number(columnValue),
                                                                    format_numbers)),
                                                '(null)'),
                                       'right');
end;
$BODY$
LANGUAGE plpgsql;


