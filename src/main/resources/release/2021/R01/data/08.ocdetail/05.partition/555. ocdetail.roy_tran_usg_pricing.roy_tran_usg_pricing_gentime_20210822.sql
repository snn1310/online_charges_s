CREATE TABLE ocdetail.roy_tran_usg_pricing_gentime_20210822
        PARTITION OF ocdetail.roy_tran_usg_pricing
        FOR VALUES FROM ('2021-08-21 00:00:00') TO ('2021-08-22 00:00:00');

