CREATE TABLE ocdetail.roy_tran_usg_pricing_gentime_20210902
        PARTITION OF ocdetail.roy_tran_usg_pricing
        FOR VALUES FROM ('2021-09-01 00:00:00') TO ('2021-09-02 00:00:00');

