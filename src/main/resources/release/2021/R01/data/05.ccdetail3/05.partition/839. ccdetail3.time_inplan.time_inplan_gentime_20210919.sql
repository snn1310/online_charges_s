CREATE TABLE ccdetail3.time_inplan_gentime_20210919
        PARTITION OF ccdetail3.time_inplan
        FOR VALUES FROM ('2021-09-18 00:00:00') TO ('2021-09-19 00:00:00');

