CREATE TABLE ccdetail2.warn_gentime_20210910
        PARTITION OF ccdetail2.warn
        FOR VALUES FROM ('2021-09-09 00:00:00') TO ('2021-09-10 00:00:00');

