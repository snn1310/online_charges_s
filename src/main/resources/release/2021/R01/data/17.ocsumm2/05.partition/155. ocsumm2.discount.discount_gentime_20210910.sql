CREATE TABLE ocsumm2.discount_gentime_20210910
        PARTITION OF ocsumm2.discount
        FOR VALUES FROM ('2021-09-09 00:00:00') TO ('2021-09-10 00:00:00');

