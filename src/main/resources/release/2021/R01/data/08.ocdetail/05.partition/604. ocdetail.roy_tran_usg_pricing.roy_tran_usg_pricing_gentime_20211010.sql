CREATE TABLE ocdetail.roy_tran_usg_pricing_gentime_20211010
        PARTITION OF ocdetail.roy_tran_usg_pricing
        FOR VALUES FROM ('2021-10-09 00:00:00') TO ('2021-10-10 00:00:00');

