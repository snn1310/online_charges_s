CREATE TABLE ccdetail4.time_inplan_gentime_20210822
        PARTITION OF ccdetail4.time_inplan
        FOR VALUES FROM ('2021-08-21 00:00:00') TO ('2021-08-22 00:00:00');

