CREATE TABLE ccdetail3.tran_inplan_gentime_20210818
        PARTITION OF ccdetail3.tran_inplan
        FOR VALUES FROM ('2021-08-17 00:00:00') TO ('2021-08-18 00:00:00');

