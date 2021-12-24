create or replace function aws_oracle_ext.dbms_xmlquery$getXML(sqlQuery text, metaType numeric default aws_oracle_ext.dbms_xmlquery$none())
 returns text
 language plpgsql
 set search_path = 'aws_oracle_ext'
as $$
begin
    return xmlserialize(document dbms_xmlquery$query2xml(pvSQL => sqlQuery,
                                                         pvRowIdAttrName => dbms_xmlquery$default_rowidattr(),
                                                         pvRowsetTag => dbms_xmlquery$default_rowsettag(),
                                                         pvRowTag => dbms_xmlquery$default_rowtag()
                                                        ) as text
                       );
end; $$
