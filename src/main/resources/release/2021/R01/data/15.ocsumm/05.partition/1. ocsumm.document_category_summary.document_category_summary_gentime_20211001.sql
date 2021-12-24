CREATE TABLE ocsumm.document_category_summary_gentime_20211001
        PARTITION OF ocsumm.document_category_summary
        FOR VALUES FROM ('2021-09-01 00:00:00') TO ('2021-10-01 00:00:00');

