CREATE TABLE ccdetail4.time_royalty_gentime_20211017
        PARTITION OF ccdetail4.time_royalty
        FOR VALUES FROM ('2021-10-16 00:00:00') TO ('2021-10-17 00:00:00');
