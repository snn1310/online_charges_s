CREATE TABLE ocsumm1.customer_document_map_gentime_20210825
        PARTITION OF ocsumm1.customer_document_map
        FOR VALUES FROM ('2021-08-24 00:00:00') TO ('2021-08-25 00:00:00');

