CREATE TABLE ocsumm1.customer_document_map_gentime_20211018
        PARTITION OF ocsumm1.customer_document_map
        FOR VALUES FROM ('2021-10-17 00:00:00') TO ('2021-10-18 00:00:00');

