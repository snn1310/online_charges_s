CREATE TABLE ocdetail.roy_tran_usg_pricing_gentime_20210921
        PARTITION OF ocdetail.roy_tran_usg_pricing
        FOR VALUES FROM ('2021-09-20 00:00:00') TO ('2021-09-21 00:00:00');

