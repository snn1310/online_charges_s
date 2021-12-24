CREATE TABLE ccdetail1.roy_tran_usg_pricing_gentime_20210927
        PARTITION OF ccdetail1.roy_tran_usg_pricing
        FOR VALUES FROM ('2021-09-26 00:00:00') TO ('2021-09-27 00:00:00');

