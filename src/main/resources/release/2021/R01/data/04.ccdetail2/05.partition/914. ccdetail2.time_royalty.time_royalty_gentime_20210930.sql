CREATE TABLE ccdetail2.time_royalty_gentime_20210930
        PARTITION OF ccdetail2.time_royalty
        FOR VALUES FROM ('2021-09-29 00:00:00') TO ('2021-09-30 00:00:00');

