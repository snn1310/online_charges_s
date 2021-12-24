CREATE TABLE ocsumm2.customer_document_map_gentime_20210930
        PARTITION OF ocsumm2.customer_document_map
        FOR VALUES FROM ('2021-09-29 00:00:00') TO ('2021-09-30 00:00:00');

