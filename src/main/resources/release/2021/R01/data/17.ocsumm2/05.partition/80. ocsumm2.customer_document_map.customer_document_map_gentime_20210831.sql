CREATE TABLE ocsumm2.customer_document_map_gentime_20210831
        PARTITION OF ocsumm2.customer_document_map
        FOR VALUES FROM ('2021-08-30 00:00:00') TO ('2021-08-31 00:00:00');

