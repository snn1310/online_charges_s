CREATE TABLE ocsumm2.customer_document_map_gentime_20211010
        PARTITION OF ocsumm2.customer_document_map
        FOR VALUES FROM ('2021-10-09 00:00:00') TO ('2021-10-10 00:00:00');

