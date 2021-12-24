CREATE TABLE ocsumm.document_category_summary_gentime_20220101
        PARTITION OF ocsumm.document_category_summary
        FOR VALUES FROM ('2021-12-01 00:00:00') TO ('2022-01-01 00:00:00');

