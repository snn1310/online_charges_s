CREATE TABLE ocsumm1.discount_gentime_20210921
        PARTITION OF ocsumm1.discount
        FOR VALUES FROM ('2021-09-20 00:00:00') TO ('2021-09-21 00:00:00');

