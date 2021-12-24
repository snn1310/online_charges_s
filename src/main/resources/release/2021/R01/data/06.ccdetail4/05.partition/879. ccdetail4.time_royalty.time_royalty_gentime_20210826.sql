CREATE TABLE ccdetail4.time_royalty_gentime_20210826
        PARTITION OF ccdetail4.time_royalty
        FOR VALUES FROM ('2021-08-25 00:00:00') TO ('2021-08-26 00:00:00');

