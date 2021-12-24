CREATE TABLE ccdetail4.warn_gentime_20210830
        PARTITION OF ccdetail4.warn
        FOR VALUES FROM ('2021-08-29 00:00:00') TO ('2021-08-30 00:00:00');

