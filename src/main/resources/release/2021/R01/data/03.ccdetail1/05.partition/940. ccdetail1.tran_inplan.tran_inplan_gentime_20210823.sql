CREATE TABLE ccdetail1.tran_inplan_gentime_20210823
        PARTITION OF ccdetail1.tran_inplan
        FOR VALUES FROM ('2021-08-22 00:00:00') TO ('2021-08-23 00:00:00');

