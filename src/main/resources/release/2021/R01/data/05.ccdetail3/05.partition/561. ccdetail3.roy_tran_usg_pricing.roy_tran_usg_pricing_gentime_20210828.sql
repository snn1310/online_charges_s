CREATE TABLE ccdetail3.roy_tran_usg_pricing_gentime_20210828
        PARTITION OF ccdetail3.roy_tran_usg_pricing
        FOR VALUES FROM ('2021-08-27 00:00:00') TO ('2021-08-28 00:00:00');

