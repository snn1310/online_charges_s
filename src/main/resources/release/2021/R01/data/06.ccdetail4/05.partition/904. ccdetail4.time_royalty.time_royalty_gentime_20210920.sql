CREATE TABLE ccdetail4.time_royalty_gentime_20210920
        PARTITION OF ccdetail4.time_royalty
        FOR VALUES FROM ('2021-09-19 00:00:00') TO ('2021-09-20 00:00:00');

