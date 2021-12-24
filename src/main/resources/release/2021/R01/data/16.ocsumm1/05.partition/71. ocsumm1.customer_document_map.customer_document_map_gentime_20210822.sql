CREATE TABLE ocsumm1.customer_document_map_gentime_20210822
        PARTITION OF ocsumm1.customer_document_map
        FOR VALUES FROM ('2021-08-21 00:00:00') TO ('2021-08-22 00:00:00');

