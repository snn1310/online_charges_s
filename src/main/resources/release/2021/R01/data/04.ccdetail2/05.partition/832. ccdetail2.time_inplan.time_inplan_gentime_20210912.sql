CREATE TABLE ccdetail2.time_inplan_gentime_20210912
        PARTITION OF ccdetail2.time_inplan
        FOR VALUES FROM ('2021-09-11 00:00:00') TO ('2021-09-12 00:00:00');
