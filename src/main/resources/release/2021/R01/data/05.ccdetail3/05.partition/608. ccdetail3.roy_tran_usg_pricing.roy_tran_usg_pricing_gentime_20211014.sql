CREATE TABLE ccdetail3.roy_tran_usg_pricing_gentime_20211014
        PARTITION OF ccdetail3.roy_tran_usg_pricing
        FOR VALUES FROM ('2021-10-13 00:00:00') TO ('2021-10-14 00:00:00');

