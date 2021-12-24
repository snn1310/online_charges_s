CREATE TABLE ccdetail2.warn_gentime_20210926
        PARTITION OF ccdetail2.warn
        FOR VALUES FROM ('2021-09-25 00:00:00') TO ('2021-09-26 00:00:00');

