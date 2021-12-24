CREATE TABLE ocsumm2.discount_gentime_20210905
        PARTITION OF ocsumm2.discount
        FOR VALUES FROM ('2021-09-04 00:00:00') TO ('2021-09-05 00:00:00');

