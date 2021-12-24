CREATE TABLE ocsumm2.discount_gentime_20210907
        PARTITION OF ocsumm2.discount
        FOR VALUES FROM ('2021-09-06 00:00:00') TO ('2021-09-07 00:00:00');

