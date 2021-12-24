CREATE TABLE ocsumm1.discount_gentime_20210930
        PARTITION OF ocsumm1.discount
        FOR VALUES FROM ('2021-09-29 00:00:00') TO ('2021-09-30 00:00:00');

