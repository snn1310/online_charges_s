CREATE TABLE ocsumm1.discount_gentime_20210902
        PARTITION OF ocsumm1.discount
        FOR VALUES FROM ('2021-09-01 00:00:00') TO ('2021-09-02 00:00:00');

