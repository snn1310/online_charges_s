CREATE TABLE ocsumm1.customer_document_map_gentime_20210929
        PARTITION OF ocsumm1.customer_document_map
        FOR VALUES FROM ('2021-09-28 00:00:00') TO ('2021-09-29 00:00:00');
