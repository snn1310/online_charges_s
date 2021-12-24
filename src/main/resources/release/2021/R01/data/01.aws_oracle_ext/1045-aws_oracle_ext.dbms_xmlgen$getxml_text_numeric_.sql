create or replace function aws_oracle_ext.dbms_xmlgen$getXML(sqlQuery text, dtdOrSchema numeric default aws_oracle_ext.dbms_xmlgen$none())
 returns text
 language plpgsql
as $$
begin
    return xmlserialize(document (aws_oracle_ext.dbms_xmlgen$qc2xml(pvSQL => sqlQuery,
				                                                    pCr => null,
				                                                    pvRowsetTag => aws_oracle_ext.dbms_xmlgen$default_rowsettag(),
				                                                    pvRowTag => aws_oracle_ext.dbms_xmlgen$default_rowtag()
				                                                   )).pxXML as text
                       );
end; $$