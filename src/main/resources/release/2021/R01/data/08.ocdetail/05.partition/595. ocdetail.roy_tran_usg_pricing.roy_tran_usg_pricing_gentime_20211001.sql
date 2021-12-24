CREATE TABLE ocdetail.roy_tran_usg_pricing_gentime_20211001
        PARTITION OF ocdetail.roy_tran_usg_pricing
        FOR VALUES FROM ('2021-09-30 00:00:00') TO ('2021-10-01 00:00:00');

