create or replace function aws_oracle_ext.dbms_xmlgen$setCtxAttrValue(
                                                        inout ctxAttributes aws_oracle_ext.dbms_xmlgen$TctxAttributes,
                                                        forceParamList text[] default null,
                                                        ctxConvertSpecialChars boolean default null,
														ctxMaxRows numeric default null,
														ctxNullHandling numeric default null,
														ctxRowsetTag text default null,
														ctxRowTag text default null,
														ctxSkipRows numeric default null,
														ctxUseNullattributeIndicator bool default null,
														ctxUseItemTagsForColl bool default null
	                                                  )
 returns aws_oracle_ext.dbms_xmlgen$TctxAttributes
 language plpgsql
 set search_path to 'aws_oracle_ext'
as $$
declare
	lforceParamList text[];
begin
	if ctxMaxRows < 0  then
		raise exception 'XML processing error. Nagative value [%] was readed', ctxMaxRows using hint = '22063';
	elsif ctxSkipRows < 0 then
		raise exception 'XML processing error. Nagative value [%] was readed', ctxSkipRows using hint = '22063';
	elsif ctxNullHandling < 0 then
		raise exception 'XML processing error. Nagative value [%] was readed', ctxNullHandling using hint = '22063';
	end if;

	lforceParamList := upper(forceParamList::text)::text[];

	ctxAttributes := (case when upper('ctxConvertSpecialChars') = any(lforceParamList) then ctxConvertSpecialChars else coalesce(ctxConvertSpecialChars, ctxAttributes.ctxConvertSpecialChars) end,
	                  case when upper('ctxMaxRows') = any(lforceParamList) then ctxMaxRows else coalesce(ctxMaxRows, ctxAttributes.ctxMaxRows) end,
                      case when upper('ctxNullHandling') = any(lforceParamList) then ctxNullHandling else coalesce(ctxNullHandling, ctxAttributes.ctxNullHandling) end,
	                  case when upper('ctxRowsetTag') = any(lforceParamList) then ctxRowsetTag else coalesce(ctxRowsetTag, ctxAttributes.ctxRowsetTag) end,
	                  case when upper('ctxRowTag') = any(lforceParamList) then ctxRowTag else coalesce(ctxRowTag, ctxAttributes.ctxRowTag) end,
	                  case when upper('ctxSkipRows') = any(lforceParamList) then ctxSkipRows else coalesce(ctxSkipRows, ctxAttributes.ctxSkipRows) end,
	                  case when upper('ctxUseNullattributeIndicator') = any(lforceParamList) then ctxUseNullattributeIndicator else coalesce(ctxUseNullattributeIndicator, ctxAttributes.ctxUseNullattributeIndicator) end,
	                  case when upper('ctxUseItemTagsForColl') = any(lforceParamList) then ctxUseItemTagsForColl else coalesce(ctxUseItemTagsForColl, ctxAttributes.ctxUseItemTagsForColl) end
                     )::dbms_xmlgen$TctxAttributes;
	lforceParamList := upper(forceParamList::text)::text[];

	ctxAttributes := (case when upper('ctxConvertSpecialChars') = any(lforceParamList) then ctxConvertSpecialChars else coalesce(ctxConvertSpecialChars, ctxAttributes.ctxConvertSpecialChars) end,
	                  case when upper('ctxMaxRows') = any(lforceParamList) then ctxMaxRows else coalesce(ctxMaxRows, ctxAttributes.ctxMaxRows) end,
                      case when upper('ctxNullHandling') = any(lforceParamList) then ctxNullHandling else coalesce(ctxNullHandling, ctxAttributes.ctxNullHandling) end,
	                  case when upper('ctxRowsetTag') = any(lforceParamList) then ctxRowsetTag else coalesce(ctxRowsetTag, ctxAttributes.ctxRowsetTag) end,
	                  case when upper('ctxRowTag') = any(lforceParamList) then ctxRowTag else coalesce(ctxRowTag, ctxAttributes.ctxRowTag) end,
	                  case when upper('ctxSkipRows') = any(lforceParamList) then ctxSkipRows else coalesce(ctxSkipRows, ctxAttributes.ctxSkipRows) end,
	                  case when upper('ctxUseNullattributeIndicator') = any(lforceParamList) then ctxUseNullattributeIndicator else coalesce(ctxUseNullattributeIndicator, ctxAttributes.ctxUseNullattributeIndicator) end,
	                  case when upper('ctxUseItemTagsForColl') = any(lforceParamList) then ctxUseItemTagsForColl else coalesce(ctxUseItemTagsForColl, ctxAttributes.ctxUseItemTagsForColl) end
                     )::dbms_xmlgen$TctxAttributes;
end; $$
;
