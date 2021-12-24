CREATE TABLE ccdetail4.roy_tran_usg_pricing_gentime_20210904
        PARTITION OF ccdetail4.roy_tran_usg_pricing
        FOR VALUES FROM ('2021-09-03 00:00:00') TO ('2021-09-04 00:00:00');

