CREATE TABLE ccdetail1.time_inplan_gentime_20211014
        PARTITION OF ccdetail1.time_inplan
        FOR VALUES FROM ('2021-10-13 00:00:00') TO ('2021-10-14 00:00:00');

