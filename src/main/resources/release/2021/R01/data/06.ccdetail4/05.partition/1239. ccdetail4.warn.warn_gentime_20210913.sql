CREATE TABLE ccdetail4.warn_gentime_20210913
        PARTITION OF ccdetail4.warn
        FOR VALUES FROM ('2021-09-12 00:00:00') TO ('2021-09-13 00:00:00');

