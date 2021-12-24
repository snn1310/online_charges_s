CREATE TABLE ccdetail3.roy_tran_usg_pricing_gentime_20210825
        PARTITION OF ccdetail3.roy_tran_usg_pricing
        FOR VALUES FROM ('2021-08-24 00:00:00') TO ('2021-08-25 00:00:00');

