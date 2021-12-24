CREATE TABLE ocsumm2.discount_gentime_20210926
        PARTITION OF ocsumm2.discount
        FOR VALUES FROM ('2021-09-25 00:00:00') TO ('2021-09-26 00:00:00');

