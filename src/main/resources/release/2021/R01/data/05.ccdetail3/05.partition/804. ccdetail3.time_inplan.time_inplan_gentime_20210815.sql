CREATE TABLE ccdetail3.time_inplan_gentime_20210815
        PARTITION OF ccdetail3.time_inplan
        FOR VALUES FROM (MINVALUE) TO ('2021-08-15 00:00:00');

