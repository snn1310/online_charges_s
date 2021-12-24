CREATE TABLE ocsumm2.discount_gentime_20210830
        PARTITION OF ocsumm2.discount
        FOR VALUES FROM ('2021-08-29 00:00:00') TO ('2021-08-30 00:00:00');

