CREATE TABLE ccdetail1.time_royalty_gentime_20210903
        PARTITION OF ccdetail1.time_royalty
        FOR VALUES FROM ('2021-09-02 00:00:00') TO ('2021-09-03 00:00:00');

