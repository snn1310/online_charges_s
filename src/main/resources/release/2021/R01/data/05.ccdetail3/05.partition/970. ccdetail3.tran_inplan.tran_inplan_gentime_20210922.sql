CREATE TABLE ccdetail3.tran_inplan_gentime_20210922
        PARTITION OF ccdetail3.tran_inplan
        FOR VALUES FROM ('2021-09-21 00:00:00') TO ('2021-09-22 00:00:00');

