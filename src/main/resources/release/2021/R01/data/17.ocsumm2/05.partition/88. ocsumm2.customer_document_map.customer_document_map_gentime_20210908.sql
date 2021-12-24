CREATE TABLE ocsumm2.customer_document_map_gentime_20210908
        PARTITION OF ocsumm2.customer_document_map
        FOR VALUES FROM ('2021-09-07 00:00:00') TO ('2021-09-08 00:00:00');

