CREATE TABLE ccdetail2.time_inplan_gentime_20210910
        PARTITION OF ccdetail2.time_inplan
        FOR VALUES FROM ('2021-09-09 00:00:00') TO ('2021-09-10 00:00:00');

