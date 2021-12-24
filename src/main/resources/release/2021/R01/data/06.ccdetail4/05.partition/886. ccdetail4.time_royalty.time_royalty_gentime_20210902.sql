CREATE TABLE ccdetail4.time_royalty_gentime_20210902
        PARTITION OF ccdetail4.time_royalty
        FOR VALUES FROM ('2021-09-01 00:00:00') TO ('2021-09-02 00:00:00');

