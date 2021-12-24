CREATE TABLE ccdetail4.time_inplan_gentime_20211008
        PARTITION OF ccdetail4.time_inplan
        FOR VALUES FROM ('2021-10-07 00:00:00') TO ('2021-10-08 00:00:00');

