CREATE TABLE ocsumm1.customer_document_map_gentime_20210901
        PARTITION OF ocsumm1.customer_document_map
        FOR VALUES FROM ('2021-08-31 00:00:00') TO ('2021-09-01 00:00:00');

