CREATE TABLE ocsumm1.customer_document_map_gentime_20210917
        PARTITION OF ocsumm1.customer_document_map
        FOR VALUES FROM ('2021-09-16 00:00:00') TO ('2021-09-17 00:00:00');
