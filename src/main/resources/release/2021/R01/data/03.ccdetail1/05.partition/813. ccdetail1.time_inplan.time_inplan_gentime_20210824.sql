CREATE TABLE ccdetail1.time_inplan_gentime_20210824
        PARTITION OF ccdetail1.time_inplan
        FOR VALUES FROM ('2021-08-23 00:00:00') TO ('2021-08-24 00:00:00');

