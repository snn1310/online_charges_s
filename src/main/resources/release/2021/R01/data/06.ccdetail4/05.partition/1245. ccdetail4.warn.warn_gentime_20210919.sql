CREATE TABLE ccdetail4.warn_gentime_20210919
        PARTITION OF ccdetail4.warn
        FOR VALUES FROM ('2021-09-18 00:00:00') TO ('2021-09-19 00:00:00');

