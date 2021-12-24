CREATE TABLE ccdetail4.tran_inplan_gentime_20211010
        PARTITION OF ccdetail4.tran_inplan
        FOR VALUES FROM ('2021-10-09 00:00:00') TO ('2021-10-10 00:00:00');

