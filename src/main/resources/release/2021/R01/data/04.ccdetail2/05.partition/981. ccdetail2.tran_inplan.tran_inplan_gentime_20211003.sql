CREATE TABLE ccdetail2.tran_inplan_gentime_20211003
        PARTITION OF ccdetail2.tran_inplan
        FOR VALUES FROM ('2021-10-02 00:00:00') TO ('2021-10-03 00:00:00');

