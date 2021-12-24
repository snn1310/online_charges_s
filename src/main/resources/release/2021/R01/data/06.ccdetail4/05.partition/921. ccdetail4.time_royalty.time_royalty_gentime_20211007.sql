CREATE TABLE ccdetail4.time_royalty_gentime_20211007
        PARTITION OF ccdetail4.time_royalty
        FOR VALUES FROM ('2021-10-06 00:00:00') TO ('2021-10-07 00:00:00');

