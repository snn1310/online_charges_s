CREATE TABLE ccdetail2.time_inplan_gentime_20210831
        PARTITION OF ccdetail2.time_inplan
        FOR VALUES FROM ('2021-08-30 00:00:00') TO ('2021-08-31 00:00:00');
