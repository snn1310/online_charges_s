CREATE TABLE ccdetail3.time_inplan_gentime_20211005
        PARTITION OF ccdetail3.time_inplan
        FOR VALUES FROM ('2021-10-04 00:00:00') TO ('2021-10-05 00:00:00');

