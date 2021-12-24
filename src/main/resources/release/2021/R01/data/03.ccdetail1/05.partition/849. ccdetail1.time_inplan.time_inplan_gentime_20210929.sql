CREATE TABLE ccdetail1.time_inplan_gentime_20210929
        PARTITION OF ccdetail1.time_inplan
        FOR VALUES FROM ('2021-09-28 00:00:00') TO ('2021-09-29 00:00:00');

