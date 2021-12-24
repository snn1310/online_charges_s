CREATE TABLE ccdetail1.tran_inplan_gentime_20210829
        PARTITION OF ccdetail1.tran_inplan
        FOR VALUES FROM ('2021-08-28 00:00:00') TO ('2021-08-29 00:00:00');

