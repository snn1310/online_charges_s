CREATE TABLE ccdetail3.roy_tran_usg_pricing_gentime_20210912
        PARTITION OF ccdetail3.roy_tran_usg_pricing
        FOR VALUES FROM ('2021-09-11 00:00:00') TO ('2021-09-12 00:00:00');

