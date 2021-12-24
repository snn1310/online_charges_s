CREATE TABLE ocsumm2.discount_gentime_20210827
        PARTITION OF ocsumm2.discount
        FOR VALUES FROM ('2021-08-26 00:00:00') TO ('2021-08-27 00:00:00');

