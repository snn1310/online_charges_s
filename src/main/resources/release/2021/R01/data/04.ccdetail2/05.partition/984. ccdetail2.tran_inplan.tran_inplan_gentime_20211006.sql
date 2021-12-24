CREATE TABLE ccdetail2.tran_inplan_gentime_20211006
        PARTITION OF ccdetail2.tran_inplan
        FOR VALUES FROM ('2021-10-05 00:00:00') TO ('2021-10-06 00:00:00');

