CREATE TABLE ccdetail4.time_inplan_gentime_20210903
        PARTITION OF ccdetail4.time_inplan
        FOR VALUES FROM ('2021-09-02 00:00:00') TO ('2021-09-03 00:00:00');

