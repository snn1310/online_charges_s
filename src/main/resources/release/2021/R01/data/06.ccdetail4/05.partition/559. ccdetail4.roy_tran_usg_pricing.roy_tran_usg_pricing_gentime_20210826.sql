CREATE TABLE ccdetail4.roy_tran_usg_pricing_gentime_20210826
        PARTITION OF ccdetail4.roy_tran_usg_pricing
        FOR VALUES FROM ('2021-08-25 00:00:00') TO ('2021-08-26 00:00:00');

