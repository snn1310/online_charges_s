CREATE TABLE ccdetail2.roy_tran_usg_pricing_gentime_20210827
        PARTITION OF ccdetail2.roy_tran_usg_pricing
        FOR VALUES FROM ('2021-08-26 00:00:00') TO ('2021-08-27 00:00:00');

