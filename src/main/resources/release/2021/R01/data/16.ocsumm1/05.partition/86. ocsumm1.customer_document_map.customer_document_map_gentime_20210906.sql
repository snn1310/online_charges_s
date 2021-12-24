CREATE TABLE ocsumm1.customer_document_map_gentime_20210906
        PARTITION OF ocsumm1.customer_document_map
        FOR VALUES FROM ('2021-09-05 00:00:00') TO ('2021-09-06 00:00:00');

