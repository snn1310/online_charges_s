CREATE TABLE ccdetail3.warn_gentime_20210820
        PARTITION OF ccdetail3.warn
        FOR VALUES FROM ('2021-08-19 00:00:00') TO ('2021-08-20 00:00:00');
