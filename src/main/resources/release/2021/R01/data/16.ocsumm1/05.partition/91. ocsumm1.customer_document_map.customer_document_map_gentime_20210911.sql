CREATE TABLE ocsumm1.customer_document_map_gentime_20210911
        PARTITION OF ocsumm1.customer_document_map
        FOR VALUES FROM ('2021-09-10 00:00:00') TO ('2021-09-11 00:00:00');

