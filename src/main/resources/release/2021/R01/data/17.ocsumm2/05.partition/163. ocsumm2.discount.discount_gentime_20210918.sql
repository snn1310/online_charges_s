CREATE TABLE ocsumm2.discount_gentime_20210918
        PARTITION OF ocsumm2.discount
        FOR VALUES FROM ('2021-09-17 00:00:00') TO ('2021-09-18 00:00:00');

