CREATE TABLE ccdetail1.roy_tran_usg_pricing_gentime_20210829
        PARTITION OF ccdetail1.roy_tran_usg_pricing
        FOR VALUES FROM ('2021-08-28 00:00:00') TO ('2021-08-29 00:00:00');

