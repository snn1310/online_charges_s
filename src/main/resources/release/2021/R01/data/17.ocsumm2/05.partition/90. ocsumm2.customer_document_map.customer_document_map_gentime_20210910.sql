CREATE TABLE ocsumm2.customer_document_map_gentime_20210910
        PARTITION OF ocsumm2.customer_document_map
        FOR VALUES FROM ('2021-09-09 00:00:00') TO ('2021-09-10 00:00:00');

