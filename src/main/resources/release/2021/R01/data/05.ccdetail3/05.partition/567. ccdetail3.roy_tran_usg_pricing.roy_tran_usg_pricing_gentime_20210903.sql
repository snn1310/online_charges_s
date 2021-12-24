CREATE TABLE ccdetail3.roy_tran_usg_pricing_gentime_20210903
        PARTITION OF ccdetail3.roy_tran_usg_pricing
        FOR VALUES FROM ('2021-09-02 00:00:00') TO ('2021-09-03 00:00:00');

