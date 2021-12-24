CREATE TABLE ccdetail1.time_royalty_gentime_20210905
        PARTITION OF ccdetail1.time_royalty
        FOR VALUES FROM ('2021-09-04 00:00:00') TO ('2021-09-05 00:00:00');

