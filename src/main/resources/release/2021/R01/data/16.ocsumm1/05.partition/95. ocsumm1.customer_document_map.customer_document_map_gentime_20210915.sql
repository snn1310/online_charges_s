CREATE TABLE ocsumm1.customer_document_map_gentime_20210915
        PARTITION OF ocsumm1.customer_document_map
        FOR VALUES FROM ('2021-09-14 00:00:00') TO ('2021-09-15 00:00:00');

