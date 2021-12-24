CREATE TABLE ocdetail.roy_tran_usg_pricing_gentime_20211008
        PARTITION OF ocdetail.roy_tran_usg_pricing
        FOR VALUES FROM ('2021-10-07 00:00:00') TO ('2021-10-08 00:00:00');

