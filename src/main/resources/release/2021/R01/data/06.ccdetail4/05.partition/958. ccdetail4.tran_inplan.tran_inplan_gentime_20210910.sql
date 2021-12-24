CREATE TABLE ccdetail4.tran_inplan_gentime_20210910
        PARTITION OF ccdetail4.tran_inplan
        FOR VALUES FROM ('2021-09-09 00:00:00') TO ('2021-09-10 00:00:00');

