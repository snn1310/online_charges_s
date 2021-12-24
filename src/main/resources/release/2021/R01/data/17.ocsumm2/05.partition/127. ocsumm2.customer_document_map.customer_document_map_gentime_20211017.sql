CREATE TABLE ocsumm2.customer_document_map_gentime_20211017
        PARTITION OF ocsumm2.customer_document_map
        FOR VALUES FROM ('2021-10-16 00:00:00') TO ('2021-10-17 00:00:00');

