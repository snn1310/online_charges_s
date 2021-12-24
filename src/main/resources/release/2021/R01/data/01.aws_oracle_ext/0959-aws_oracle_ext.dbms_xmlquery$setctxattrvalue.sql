create or replace function aws_oracle_ext.dbms_xmlquery$setCtxAttrValue(
                                                        inout ctxAttributes aws_oracle_ext.dbms_xmlquery$TctxAttributes,
                                                        forceParamList text[] default null,
                                                        ctxBindValue aws_oracle_ext.dbms_xmlquery$tctxdictionary[] default null,
  			                                            ctxDataHeader aws_oracle_ext.dbms_xmlquery$TctxDictionary default null,
												        ctxCollIdAttrName text default null,
												        ctxDateFormat text default null,
												        ctxEncodingTag text default null,
												        ctxErrorTag text default null,
												        ctxMaxRows numeric default null,
												        ctxMetaHeader text default null,
												        ctxRaiseException boolean default null, --
												        ctxRaiseNoRowsException boolean default null,
												        ctxRowidAttrName text default null, --
												        ctxRowIdAttrValue text default null,
												        ctxRowSetTag text default null,
												        ctxRowTag text default null,
												        ctxSkipRows numeric default null,
												        ctxSQLToXMLNameEscaping boolean default null,
												        ctxStyleSheetHeader aws_oracle_ext.dbms_xmlquery$TctxDictionary default null, --text,
												        ctxTagCase numeric default null,
												        ctxXSLT aws_oracle_ext.dbms_xmlquery$TctxDictionary default null, --text,
												        ctxXSLTParam aws_oracle_ext.dbms_xmlquery$TctxDictionary default null, --text,
												        ctxUseNullAttributeIndicator boolean default null,
												        ctxUseTypeForCollElemTag boolean default null
	                                                  )
 returns aws_oracle_ext.dbms_xmlquery$TctxAttributes
 language plpgsql
 set search_path to 'aws_oracle_ext'
as $$
declare
	lforceParamList text[];
begin
	lforceParamList := upper(forceParamList::text)::text[];

	ctxAttributes := (case when upper('ctxBindValue') = any(lforceParamList) then ctxBindValue else array_cat(ctxAttributes.ctxBindValue, ctxBindValue) end,
	                  case when upper('ctxDataHeader') = any(lforceParamList) then ctxDataHeader else coalesce(ctxDataHeader, ctxAttributes.ctxDataHeader) end,
                      case when upper('ctxCollIdAttrName') = any(lforceParamList) then ctxCollIdAttrName else coalesce(ctxCollIdAttrName, ctxAttributes.ctxCollIdAttrName) end,
	                  case when upper('ctxDateFormat') = any(lforceParamList) then ctxDateFormat else coalesce(ctxDateFormat, ctxAttributes.ctxDateFormat) end,
	                  case when upper('ctxEncodingTag') = any(lforceParamList) then ctxEncodingTag else coalesce(ctxEncodingTag, ctxAttributes.ctxEncodingTag) end,
	                  case when upper('ctxErrorTag') = any(lforceParamList) then ctxErrorTag else coalesce(ctxErrorTag, ctxAttributes.ctxErrorTag) end,
	                  case when upper('ctxMaxRows') = any(lforceParamList) then ctxMaxRows else coalesce(ctxMaxRows, ctxAttributes.ctxMaxRows) end,
	                  case when upper('ctxMetaHeader') = any(lforceParamList) then ctxMetaHeader else coalesce(ctxMetaHeader, ctxAttributes.ctxMetaHeader) end,
	                  case when upper('ctxRaiseException') = any(lforceParamList) then ctxRaiseException else coalesce(ctxRaiseException, ctxAttributes.ctxRaiseException) end,
	                  case when upper('ctxRaiseNoRowsException') = any(lforceParamList) then ctxRaiseNoRowsException else coalesce(ctxRaiseNoRowsException, ctxAttributes.ctxRaiseNoRowsException) end,
	                  case when upper('ctxRowIdAttrName') = any(lforceParamList) then ctxRowIdAttrName else coalesce(ctxRowIdAttrName, ctxAttributes.ctxRowIdAttrName) end,
	                  case when upper('ctxRowIdAttrValue') = any(lforceParamList) then ctxRowIdAttrValue else coalesce(ctxRowIdAttrValue, ctxAttributes.ctxRowIdAttrValue) end,
	                  case when upper('ctxRowSetTag') = any(lforceParamList) then ctxRowSetTag else coalesce(ctxRowSetTag, ctxAttributes.ctxRowSetTag) end,
	                  case when upper('ctxRowTag') = any(lforceParamList) then ctxRowTag else coalesce(ctxRowTag, ctxAttributes.ctxRowTag) end,
	                  case when upper('ctxSkipRows') = any(lforceParamList) then ctxSkipRows else coalesce(ctxSkipRows, ctxAttributes.ctxSkipRows) end,
	                  case when upper('ctxSQLToXMLNameEscaping') = any(lforceParamList) then ctxSQLToXMLNameEscaping else coalesce(ctxSQLToXMLNameEscaping, ctxAttributes.ctxSQLToXMLNameEscaping) end,
	                  case when upper('ctxStyleSheetHeader') = any(lforceParamList) then ctxStyleSheetHeader else coalesce(ctxStyleSheetHeader, ctxAttributes.ctxStyleSheetHeader) end,
	                  case when upper('ctxTagCase') = any(lforceParamList) then ctxTagCase else coalesce(ctxTagCase, ctxAttributes.ctxTagCase) end,
	                  case when upper('ctxXSLT') = any(lforceParamList) then ctxXSLT else coalesce(ctxXSLT, ctxAttributes.ctxXSLT) end,
	                  case when upper('ctxXSLTParam') = any(lforceParamList) then ctxXSLTParam else coalesce(ctxXSLTParam, ctxAttributes.ctxXSLTParam) end,
	                  case when upper('ctxUseNullAttributeIndicator') = any(lforceParamList) then ctxUseNullAttributeIndicator else coalesce(ctxUseNullAttributeIndicator, ctxAttributes.ctxUseNullAttributeIndicator) end,
	                  case when upper('ctxUseTypeForCollElemTag') = any(lforceParamList) then ctxUseTypeForCollElemTag else coalesce(ctxUseTypeForCollElemTag, ctxAttributes.ctxUseTypeForCollElemTag) end
                     )::dbms_xmlquery$TctxAttributes;
end; $$
;