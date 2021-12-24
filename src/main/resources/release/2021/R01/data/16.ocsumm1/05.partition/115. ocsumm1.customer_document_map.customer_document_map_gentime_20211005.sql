CREATE TABLE ocsumm1.customer_document_map_gentime_20211005
        PARTITION OF ocsumm1.customer_document_map
        FOR VALUES FROM ('2021-10-04 00:00:00') TO ('2021-10-05 00:00:00');

