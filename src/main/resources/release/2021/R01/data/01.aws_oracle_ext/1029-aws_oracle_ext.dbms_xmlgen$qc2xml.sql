create or replace function aws_oracle_ext.dbms_xmlgen$qc2xml(pvSQL text,
                                                             pCr refcursor,
                                                             pbAddXmlRoot boolean default true,
	                                                         pbConvertSpecialChars boolean default null,
                                                             pnMaxRows numeric default null,
                                                             pnNullHandling numeric default null,
                                                             pvRowsetTag text default null,
                                                             pvRowTag text default null,
                                                             pnSkipRows numeric default null,
                                                             pbUseNullattributeIndicator bool default null,
                                                             pbUseItemTagsForColl bool default null,
                                                             out pxXML xml,
                                                             out pnRowCount int
                                                           )
 returns record
 language plpgsql
as $$
declare

  crMain refcursor;
  lxResult xml := null;
  lxXMLArr xml[];

  lvSQL text := pvSQL;
  lCr refcursor := pCr;

  lbAddXmlRoot boolean := coalesce(pbAddXmlRoot, true);
  lbConvertSpecialChars boolean := pbConvertSpecialChars;
  lnMaxRows int := trunc(pnMaxRows);
  lnNullHandling numeric := pnNullHandling;
  lvRowsetTag text := nullif(pvRowsetTag, '');
  lvRowTag text := nullif(pvRowTag, '');
  lnSkipRows int := trunc(pnSkipRows);
  lbUseNullattributeIndicator bool := pbUseNullattributeIndicator;
  lbUseItemTagsForColl bool := pbUseItemTagsForColl;

  lvQuery text;
  lvQueryROWSETTAG text :=  $query$ select xmlelement(name %1$s, xmlagg(row))
							          from unnest($1) as q(row)
       				        $query$;

  lvQueryROWTAG text := $query$ select xmlelement(name %2$s,
                                                  xmlagg(xmlelement(name %1$s, row))
				                                 )
							      from unnest($1) as q(row)
       				    $query$;

begin

   if lvRowSetTag is not null and lvRowTag is not null then

   	 lvQuery := format(lvQueryROWTAG, lvRowTag, lvRowSetTag);

   elsif lvRowSetTag is null and lvRowTag is not null or
         lvRowSetTag is not null and lvRowTag is null then

     lvQuery := format(lvQueryROWSETTAG, coalesce(lvRowSetTag, lvRowTag));

   elseif lvRowTag is null and lvRowSetTag is null then

     lxResult := xmlparse(content '<ERROR>ext.XMLSQLException: The row-set tag and the row tag are both omitted.</ERROR>');

   else

   	 lxResult := xmlparse(content '<ERROR>ext.XMLSQLException: Undeterminated error.</ERROR>');
   end if; -- if lvRowSetTag is not null and lvRowTag is not null thenn


   if lxResult is null then
     if nullif(lvSQL, '') is not null or
        nullif(lCr::text, '') is not null then

	   select array_agg(xmlrow)
	     into lxXMLArr
	     from aws_oracle_ext.dbms_xmlgen$qc2xmltab(pvSQL => lvSQL,
                                                   pCr => lCr,
                                                   pnLimit => lnMaxRows,
                                                   pnOffset => lnSkipRows
                                                  );
	 else
	   raise exception 'Null Exception.' using hint = '29532';
	 end if;

     begin
         open crMain for execute lvQuery using lxXMLArr;
         fetch crMain into lxResult;
         close crMain;
     end;

   end if; -- if lvResult is null then

   if lbAddXmlRoot then
   	lxResult := xmlroot(lxResult, version '1.0', standalone yes);
   end if;

   pxXML := lxResult;
   pnRowCount := array_length(lxXMLArr, 1);
end; $$