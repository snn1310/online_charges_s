CREATE TABLE ocsumm1.discount_gentime_20210820
        PARTITION OF ocsumm1.discount
        FOR VALUES FROM ('2021-08-19 00:00:00') TO ('2021-08-20 00:00:00');

