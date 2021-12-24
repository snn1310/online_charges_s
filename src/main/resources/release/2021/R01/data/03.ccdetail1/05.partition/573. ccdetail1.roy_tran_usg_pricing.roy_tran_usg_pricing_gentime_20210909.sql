CREATE TABLE ccdetail1.roy_tran_usg_pricing_gentime_20210909
        PARTITION OF ccdetail1.roy_tran_usg_pricing
        FOR VALUES FROM ('2021-09-08 00:00:00') TO ('2021-09-09 00:00:00');

