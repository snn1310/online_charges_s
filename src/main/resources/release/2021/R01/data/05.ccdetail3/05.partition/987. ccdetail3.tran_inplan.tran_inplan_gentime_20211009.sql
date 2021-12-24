CREATE TABLE ccdetail3.tran_inplan_gentime_20211009
        PARTITION OF ccdetail3.tran_inplan
        FOR VALUES FROM ('2021-10-08 00:00:00') TO ('2021-10-09 00:00:00');

