CREATE TABLE ocsumm1.customer_document_map_gentime_20210816
        PARTITION OF ocsumm1.customer_document_map
        FOR VALUES FROM (MINVALUE) TO ('2021-08-16 00:00:00');

