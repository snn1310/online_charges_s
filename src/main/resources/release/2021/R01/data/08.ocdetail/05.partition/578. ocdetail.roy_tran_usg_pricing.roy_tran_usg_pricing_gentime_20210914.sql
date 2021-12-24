CREATE TABLE ocdetail.roy_tran_usg_pricing_gentime_20210914
        PARTITION OF ocdetail.roy_tran_usg_pricing
        FOR VALUES FROM ('2021-09-13 00:00:00') TO ('2021-09-14 00:00:00');

