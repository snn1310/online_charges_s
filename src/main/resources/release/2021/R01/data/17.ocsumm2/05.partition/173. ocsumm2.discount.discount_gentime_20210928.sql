CREATE TABLE ocsumm2.discount_gentime_20210928
        PARTITION OF ocsumm2.discount
        FOR VALUES FROM ('2021-09-27 00:00:00') TO ('2021-09-28 00:00:00');

