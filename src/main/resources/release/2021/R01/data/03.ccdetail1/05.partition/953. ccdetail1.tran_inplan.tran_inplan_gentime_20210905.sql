CREATE TABLE ccdetail1.tran_inplan_gentime_20210905
        PARTITION OF ccdetail1.tran_inplan
        FOR VALUES FROM ('2021-09-04 00:00:00') TO ('2021-09-05 00:00:00');

