CREATE TABLE ccdetail3.time_inplan_gentime_20210819
        PARTITION OF ccdetail3.time_inplan
        FOR VALUES FROM ('2021-08-18 00:00:00') TO ('2021-08-19 00:00:00');

