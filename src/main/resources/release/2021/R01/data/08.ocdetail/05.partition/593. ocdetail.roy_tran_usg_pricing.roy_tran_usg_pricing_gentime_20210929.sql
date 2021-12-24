CREATE TABLE ocdetail.roy_tran_usg_pricing_gentime_20210929
        PARTITION OF ocdetail.roy_tran_usg_pricing
        FOR VALUES FROM ('2021-09-28 00:00:00') TO ('2021-09-29 00:00:00');

