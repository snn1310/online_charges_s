CREATE TABLE ccdetail4.time_royalty_gentime_20210916
        PARTITION OF ccdetail4.time_royalty
        FOR VALUES FROM ('2021-09-15 00:00:00') TO ('2021-09-16 00:00:00');

