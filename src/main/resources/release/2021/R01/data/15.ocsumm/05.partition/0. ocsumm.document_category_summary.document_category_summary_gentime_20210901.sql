CREATE TABLE ocsumm.document_category_summary_gentime_20210901
        PARTITION OF ocsumm.document_category_summary
        FOR VALUES FROM (MINVALUE) TO ('2021-09-01 00:00:00');

