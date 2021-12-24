CREATE TABLE ccdetail3.warn_gentime_20210921
        PARTITION OF ccdetail3.warn
        FOR VALUES FROM ('2021-09-20 00:00:00') TO ('2021-09-21 00:00:00');

