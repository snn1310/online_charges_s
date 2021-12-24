CREATE TABLE ocdetail.roy_tran_usg_pricing_gentime_20210917
        PARTITION OF ocdetail.roy_tran_usg_pricing
        FOR VALUES FROM ('2021-09-16 00:00:00') TO ('2021-09-17 00:00:00');

