CREATE TABLE ccdetail3.roy_tran_usg_pricing_gentime_20210915
        PARTITION OF ccdetail3.roy_tran_usg_pricing
        FOR VALUES FROM ('2021-09-14 00:00:00') TO ('2021-09-15 00:00:00');

