CREATE TABLE ocsumm2.discount_gentime_20210922
        PARTITION OF ocsumm2.discount
        FOR VALUES FROM ('2021-09-21 00:00:00') TO ('2021-09-22 00:00:00');

