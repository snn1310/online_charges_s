CREATE TABLE ocdetail.roy_tran_usg_pricing_gentime_20211003
        PARTITION OF ocdetail.roy_tran_usg_pricing
        FOR VALUES FROM ('2021-10-02 00:00:00') TO ('2021-10-03 00:00:00');

