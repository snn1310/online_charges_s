CREATE TABLE ccdetail4.tran_inplan_gentime_20210924
        PARTITION OF ccdetail4.tran_inplan
        FOR VALUES FROM ('2021-09-23 00:00:00') TO ('2021-09-24 00:00:00');

