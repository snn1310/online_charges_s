CREATE TABLE ccdetail1.warn_gentime_20210921
        PARTITION OF ccdetail1.warn
        FOR VALUES FROM ('2021-09-20 00:00:00') TO ('2021-09-21 00:00:00');

