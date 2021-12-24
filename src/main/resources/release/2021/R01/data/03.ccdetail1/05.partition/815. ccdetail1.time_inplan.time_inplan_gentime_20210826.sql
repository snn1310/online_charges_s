CREATE TABLE ccdetail1.time_inplan_gentime_20210826
        PARTITION OF ccdetail1.time_inplan
        FOR VALUES FROM ('2021-08-25 00:00:00') TO ('2021-08-26 00:00:00');

