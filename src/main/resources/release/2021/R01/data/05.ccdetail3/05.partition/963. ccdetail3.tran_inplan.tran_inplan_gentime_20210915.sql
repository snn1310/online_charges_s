CREATE TABLE ccdetail3.tran_inplan_gentime_20210915
        PARTITION OF ccdetail3.tran_inplan
        FOR VALUES FROM ('2021-09-14 00:00:00') TO ('2021-09-15 00:00:00');

