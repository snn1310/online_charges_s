CREATE TABLE ccdetail2.warn_gentime_20210915
        PARTITION OF ccdetail2.warn
        FOR VALUES FROM ('2021-09-14 00:00:00') TO ('2021-09-15 00:00:00');

