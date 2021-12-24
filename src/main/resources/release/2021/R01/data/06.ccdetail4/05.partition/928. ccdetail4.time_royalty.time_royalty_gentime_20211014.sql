CREATE TABLE ccdetail4.time_royalty_gentime_20211014
        PARTITION OF ccdetail4.time_royalty
        FOR VALUES FROM ('2021-10-13 00:00:00') TO ('2021-10-14 00:00:00');

