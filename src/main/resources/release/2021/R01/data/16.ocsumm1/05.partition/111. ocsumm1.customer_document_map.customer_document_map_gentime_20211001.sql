CREATE TABLE ocsumm1.customer_document_map_gentime_20211001
        PARTITION OF ocsumm1.customer_document_map
        FOR VALUES FROM ('2021-09-30 00:00:00') TO ('2021-10-01 00:00:00');

