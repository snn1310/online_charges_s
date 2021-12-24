CREATE TABLE ocdetail.roy_tran_usg_pricing_gentime_20210911
        PARTITION OF ocdetail.roy_tran_usg_pricing
        FOR VALUES FROM ('2021-09-10 00:00:00') TO ('2021-09-11 00:00:00');

