CREATE TABLE ccdetail1.roy_tran_usg_pricing_gentime_20210822
        PARTITION OF ccdetail1.roy_tran_usg_pricing
        FOR VALUES FROM ('2021-08-21 00:00:00') TO ('2021-08-22 00:00:00');

