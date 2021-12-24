CREATE TABLE ocsumm2.customer_document_map_gentime_20211003
        PARTITION OF ocsumm2.customer_document_map
        FOR VALUES FROM ('2021-10-02 00:00:00') TO ('2021-10-03 00:00:00');

