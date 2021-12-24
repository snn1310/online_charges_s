create or replace function aws_oracle_ext.dbms_xmlquery$query2xml(pvSQL text,
                                                                  pbAddXmlRoot boolean default true,
                                                                  pjBindValue aws_oracle_ext.dbms_xmlquery$tctxdictionary[] default null,
			  			                                          pjDataHeader aws_oracle_ext.dbms_xmlquery$TctxDictionary  default null,
			                                                      pvCallIdAttrName text  default null,
			                                                      pvDateFormat text  default null,
			                                                      pvEncodingTag text  default null,
			                                                      pvErrorTag text default null,
			                                                      pnMaxRows numeric default null,
			                                                      pvMetaHeader text default null,
			                                                      pbRaiseException boolean default null,
			                                                      pbRaiseNoRowsException boolean default null,
			                                                      pvRowIdAttrName text default null,
			                                                      pvRowIdAttrValue text default null,
			                                                      pvRowSetTag text default null,
			                                                      pvRowTag text default null,
			                                                      pnSkipRows numeric default null,
			                                                      pbSQLToXMLNameEscaping boolean default null,
			                                                      pnStyleSheetHeader aws_oracle_ext.dbms_xmlquery$TctxDictionary default null,
			                                                      pvTagCase numeric default null,
			                                                      pjXSLT aws_oracle_ext.dbms_xmlquery$TctxDictionary default null,
			                                                      pjXSLTParam aws_oracle_ext.dbms_xmlquery$TctxDictionary default null,
			                                                      pbUseNullAttributeIndicator boolean default null,
			                                                      pbUseTypeForCollElemTag boolean default null)
 returns xml
 language plpgsql
as $$
declare
  crMain refcursor;
  lvResult xml := null;

  lvSQL text := $pvSQL$ %1$s $pvSQL$;

  lbAddXmlRoot boolean := coalesce(pbAddXmlRoot, true);
  ljBindValue aws_oracle_ext.dbms_xmlquery$TctxDictionary[] := pjBindValue;
  ljDataHeader aws_oracle_ext.dbms_xmlquery$TctxDictionary := pjDataHeader;
  lvCallIdAttrName text := pvCallIdAttrName;
  lvDateFormat text := pvDateFormat;
  lvEncodingTag text := pvEncodingTag;
  lvErrorTag text := pvErrorTag;
  lnMaxRows numeric := pnMaxRows;
  lvMetaHeader text := pvMetaHeader;
  lbRaiseException boolean := pbRaiseException;
  lbRaiseNoRowsException boolean := pbRaiseNoRowsException;
  lvRowIdAttrName text := nullif(pvRowIdAttrName, '');
  lvRowIdAttrValue text := nullif(pvRowIdAttrValue, '');
  lvRowSetTag text := nullif(pvRowSetTag,'');
  lvRowTag text := nullif(pvRowTag,'');
  lnSkipRows numeric := pnSkipRows;
  lbSQLToXMLNameEscaping text := pbSQLToXMLNameescaping;
  lnStyleSheetHeader aws_oracle_ext.dbms_xmlquery$TctxDictionary := pnStyleSheetHeader;
  lvTagCase numeric := pvTagCase;
  ljXSLT aws_oracle_ext.dbms_xmlquery$TctxDictionary := pjXSLT;
  ljXSLTParam aws_oracle_ext.dbms_xmlquery$TctxDictionary := pjXSLTParam;
  lbUseNullAttributeIndicator boolean := pbUseNullAttributeIndicator;
  lbUseTypeForCollElemTag boolean := pbUseTypeForCollElemTag;
  lvDummy text;

  lvQuery text;
  lvQueryROW text := $row_data$ select row_number() over () as num,
  					                   (select xmlagg(row) from unnest(xpath('row/*', row_data, array[array['xsi', 'http://www.w3.org/2001/XMLSchema-instance']])) as row) as row
								   from unnest(xpath('table/*',
								                     query_to_xml($query$ %1$s $query$, false, false, ''),
								                     array[array['xsi', 'http://www.w3.org/2001/XMLSchema-instance']])
								              ) as row_data
					$row_data$;
  lvQueryDATAHEADER text := $query$ select xmlelement(name "%1$s", '%2$s', (%3$s)) $query$;

  lvQueryROWSETTAG text :=  $query$ select xmlelement(name %2$s, xmlagg(row)
				                              )
							          from (%1$s) as q
       				        $query$;

  lvQueryROWTAG text := $query$ select xmlelement(name %5$s,
                                                  xmlagg(xmlelement(name %4$s, xmlattributes(%2$s as %3$s), row ))
				                                 )
							      from (%1$s) as q
       				    $query$;

begin
   if nullif(pvSQL, '') is not null then
	  lvSQL := format(lvSQL, pvSQL);
      lvQuery := format(lvQueryROW, lvSQL);
   else
	 raise exception 'Null Exception.' using hint = '29532';
   end if;

   if lvRowTag is null and lvRowSetTag is null then
   	lvResult := xmlparse(content '<ERROR>ext.XMLSQLException: The row-set tag and the row tag are both omitted.</ERROR>');

   elsif lvRowSetTag is null and lvRowTag is not null or
         lvRowSetTag is not null and lvRowTag is null then

    lvQuery := format(lvQueryROWSETTAG, lvQuery, coalesce(lvRowSetTag, lvRowTag));

   elseif lvRowSetTag is not null and lvRowTag is not null then

    lvDummy := case when lvRowIdAttrName is null then 'NULL' else 'num' end;
    lvRowIdAttrName := coalesce(lvRowIdAttrName, 'empty_row_num');
   	lvQuery := format(lvQueryROWTAG, lvQuery, lvDummy, lvRowIdAttrName, lvRowTag, lvRowSetTag);

   else

   	lvResult := xmlparse(content '<ERROR>ext.XMLSQLException: Undeterminated error.</ERROR>');
   end if; -- if lvRowTag is null and lvRowSetTag is null then


  if lvResult is null then

   if pjDataHeader is not null and nullif(pjDataHeader.var, '') is not null then
   	 lvQuery := format(lvQueryDATAHEADER, pjDataHeader.value, pjDataHeader.var, lvQuery);
   end if; -- if pjDataHeader is not null and nullif(pjDataHeader.var, '') is not null then

   open crMain for execute lvQuery;
    fetch crMain into lvResult;
   close crMain;
  end if; -- if lvResult is null then

   if lbAddXmlRoot then
   	lvResult := xmlroot(lvResult, version '1.0', standalone yes);
   end if;

   return lvResult;
end; $$