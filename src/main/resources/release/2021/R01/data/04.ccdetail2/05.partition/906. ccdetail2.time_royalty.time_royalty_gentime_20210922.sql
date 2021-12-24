CREATE TABLE ccdetail2.time_royalty_gentime_20210922
        PARTITION OF ccdetail2.time_royalty
        FOR VALUES FROM ('2021-09-21 00:00:00') TO ('2021-09-22 00:00:00');

