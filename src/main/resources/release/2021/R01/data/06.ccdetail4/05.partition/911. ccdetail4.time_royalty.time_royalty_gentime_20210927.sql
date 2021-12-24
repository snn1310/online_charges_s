CREATE TABLE ccdetail4.time_royalty_gentime_20210927
        PARTITION OF ccdetail4.time_royalty
        FOR VALUES FROM ('2021-09-26 00:00:00') TO ('2021-09-27 00:00:00');

