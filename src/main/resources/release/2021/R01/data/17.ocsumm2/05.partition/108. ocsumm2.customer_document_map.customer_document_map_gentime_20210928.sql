CREATE TABLE ocsumm2.customer_document_map_gentime_20210928
        PARTITION OF ocsumm2.customer_document_map
        FOR VALUES FROM ('2021-09-27 00:00:00') TO ('2021-09-28 00:00:00');

