CREATE TABLE ccdetail1.time_royalty_gentime_20210921
        PARTITION OF ccdetail1.time_royalty
        FOR VALUES FROM ('2021-09-20 00:00:00') TO ('2021-09-21 00:00:00');

