CREATE TABLE ocsumm2.discount_gentime_20211019
        PARTITION OF ocsumm2.discount
        FOR VALUES FROM ('2021-10-18 00:00:00') TO ('2021-10-19 00:00:00');

