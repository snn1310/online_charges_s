CREATE TABLE ccdetail3.time_royalty_gentime_20211004
        PARTITION OF ccdetail3.time_royalty
        FOR VALUES FROM ('2021-10-03 00:00:00') TO ('2021-10-04 00:00:00');

