CREATE TABLE ocsumm2.customer_document_map_gentime_20211013
        PARTITION OF ocsumm2.customer_document_map
        FOR VALUES FROM ('2021-10-12 00:00:00') TO ('2021-10-13 00:00:00');

