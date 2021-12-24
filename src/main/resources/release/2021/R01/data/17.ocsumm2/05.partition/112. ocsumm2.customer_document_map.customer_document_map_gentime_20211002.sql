CREATE TABLE ocsumm2.customer_document_map_gentime_20211002
        PARTITION OF ocsumm2.customer_document_map
        FOR VALUES FROM ('2021-10-01 00:00:00') TO ('2021-10-02 00:00:00');

