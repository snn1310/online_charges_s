CREATE TABLE ocdetail.roy_tran_usg_pricing_gentime_20211004
        PARTITION OF ocdetail.roy_tran_usg_pricing
        FOR VALUES FROM ('2021-10-03 00:00:00') TO ('2021-10-04 00:00:00');

