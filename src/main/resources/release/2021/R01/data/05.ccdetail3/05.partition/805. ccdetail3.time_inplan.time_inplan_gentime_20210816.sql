CREATE TABLE ccdetail3.time_inplan_gentime_20210816
        PARTITION OF ccdetail3.time_inplan
        FOR VALUES FROM ('2021-08-15 00:00:00') TO ('2021-08-16 00:00:00');

