CREATE TABLE ocsumm2.customer_document_map_gentime_20211008
        PARTITION OF ocsumm2.customer_document_map
        FOR VALUES FROM ('2021-10-07 00:00:00') TO ('2021-10-08 00:00:00');

