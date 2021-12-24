CREATE TABLE ccdetail4.time_royalty_gentime_20210924
        PARTITION OF ccdetail4.time_royalty
        FOR VALUES FROM ('2021-09-23 00:00:00') TO ('2021-09-24 00:00:00');

