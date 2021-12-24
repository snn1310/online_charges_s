CREATE TABLE ocsumm2.customer_document_map_gentime_20210818
        PARTITION OF ocsumm2.customer_document_map
        FOR VALUES FROM ('2021-08-17 00:00:00') TO ('2021-08-18 00:00:00');

