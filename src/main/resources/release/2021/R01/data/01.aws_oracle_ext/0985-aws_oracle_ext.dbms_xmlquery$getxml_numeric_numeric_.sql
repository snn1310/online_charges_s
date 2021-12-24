create or replace function aws_oracle_ext.dbms_xmlquery$getXML(ctxHdl numeric, metaType numeric default aws_oracle_ext.dbms_xmlquery$none())
 returns text
 language plpgsql
 set search_path = 'aws_oracle_ext'
as $$
declare
    ctxObj dbms_xmlquery$tcontext;
begin
	ctxObj := dbms_xmlquery$context2obj(ctxHdl);
    return xmlserialize(document dbms_xmlquery$query2xml(pvSQL => ctxObj.ctxQuery,
                                                         pjDataHeader => (ctxObj.ctxAttributes).ctxDataHeader,
                                                         pvRowIdAttrName => (ctxObj.ctxAttributes).ctxRowIdAttrName,
                                                         pvRowsetTag => (ctxObj.ctxAttributes).ctxRowsettag,
                                                         pvRowTag => (ctxObj.ctxAttributes).ctxRowTag
                                               ) as text
                        );
end; $$