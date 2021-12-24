CREATE TABLE ocdetail.roy_tran_usg_pricing_gentime_20210816
        PARTITION OF ocdetail.roy_tran_usg_pricing
        FOR VALUES FROM ('2021-08-15 00:00:00') TO ('2021-08-16 00:00:00');

