CREATE TABLE ccdetail4.roy_tran_usg_pricing_gentime_20210819
        PARTITION OF ccdetail4.roy_tran_usg_pricing
        FOR VALUES FROM ('2021-08-18 00:00:00') TO ('2021-08-19 00:00:00');

