CREATE TABLE ccdetail4.tran_inplan_gentime_20211002
        PARTITION OF ccdetail4.tran_inplan
        FOR VALUES FROM ('2021-10-01 00:00:00') TO ('2021-10-02 00:00:00');

