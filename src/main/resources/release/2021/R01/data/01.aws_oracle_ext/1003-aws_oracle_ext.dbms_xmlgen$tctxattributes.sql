create type aws_oracle_ext.dbms_xmlgen$TctxAttributes as
       (ctxConvertSpecialChars boolean,
        ctxMaxRows numeric,
        ctxNullHandling numeric,
        ctxRowsetTag text,
        ctxRowTag text,
        ctxSkipRows numeric,
        ctxUseNullattributeIndicator bool,
        ctxUseItemTagsForColl bool
       );