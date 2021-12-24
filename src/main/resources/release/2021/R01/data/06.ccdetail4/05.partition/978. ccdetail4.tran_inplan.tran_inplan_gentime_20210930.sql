CREATE TABLE ccdetail4.tran_inplan_gentime_20210930
        PARTITION OF ccdetail4.tran_inplan
        FOR VALUES FROM ('2021-09-29 00:00:00') TO ('2021-09-30 00:00:00');

