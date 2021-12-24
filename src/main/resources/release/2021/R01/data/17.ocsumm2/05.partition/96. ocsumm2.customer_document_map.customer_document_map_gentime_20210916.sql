CREATE TABLE ocsumm2.customer_document_map_gentime_20210916
        PARTITION OF ocsumm2.customer_document_map
        FOR VALUES FROM ('2021-09-15 00:00:00') TO ('2021-09-16 00:00:00');

