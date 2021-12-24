CREATE TABLE ccdetail3.roy_tran_usg_pricing_gentime_20210913
        PARTITION OF ccdetail3.roy_tran_usg_pricing
        FOR VALUES FROM ('2021-09-12 00:00:00') TO ('2021-09-13 00:00:00');

