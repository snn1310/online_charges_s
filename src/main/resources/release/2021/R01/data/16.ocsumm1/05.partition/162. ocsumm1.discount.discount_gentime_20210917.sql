CREATE TABLE ocsumm1.discount_gentime_20210917
        PARTITION OF ocsumm1.discount
        FOR VALUES FROM ('2021-09-16 00:00:00') TO ('2021-09-17 00:00:00');

