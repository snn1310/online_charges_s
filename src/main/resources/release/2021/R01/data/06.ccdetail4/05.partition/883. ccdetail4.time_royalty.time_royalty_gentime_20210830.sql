CREATE TABLE ccdetail4.time_royalty_gentime_20210830
        PARTITION OF ccdetail4.time_royalty
        FOR VALUES FROM ('2021-08-29 00:00:00') TO ('2021-08-30 00:00:00');

