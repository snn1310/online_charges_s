CREATE TABLE ccdetail1.time_inplan_gentime_20210830
        PARTITION OF ccdetail1.time_inplan
        FOR VALUES FROM ('2021-08-29 00:00:00') TO ('2021-08-30 00:00:00');
