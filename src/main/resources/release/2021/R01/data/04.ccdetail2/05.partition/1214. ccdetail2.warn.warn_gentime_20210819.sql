CREATE TABLE ccdetail2.warn_gentime_20210819
        PARTITION OF ccdetail2.warn
        FOR VALUES FROM ('2021-08-18 00:00:00') TO ('2021-08-19 00:00:00');

