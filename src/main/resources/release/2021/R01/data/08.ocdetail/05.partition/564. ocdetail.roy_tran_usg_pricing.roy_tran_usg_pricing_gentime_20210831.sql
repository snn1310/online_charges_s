CREATE TABLE ocdetail.roy_tran_usg_pricing_gentime_20210831
        PARTITION OF ocdetail.roy_tran_usg_pricing
        FOR VALUES FROM ('2021-08-30 00:00:00') TO ('2021-08-31 00:00:00');

