CREATE TABLE ccdetail4.time_royalty_gentime_20210901
        PARTITION OF ccdetail4.time_royalty
        FOR VALUES FROM ('2021-08-31 00:00:00') TO ('2021-09-01 00:00:00');

