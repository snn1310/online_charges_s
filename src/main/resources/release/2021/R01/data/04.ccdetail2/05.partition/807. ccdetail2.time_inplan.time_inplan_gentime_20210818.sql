CREATE TABLE ccdetail2.time_inplan_gentime_20210818
        PARTITION OF ccdetail2.time_inplan
        FOR VALUES FROM ('2021-08-17 00:00:00') TO ('2021-08-18 00:00:00');

