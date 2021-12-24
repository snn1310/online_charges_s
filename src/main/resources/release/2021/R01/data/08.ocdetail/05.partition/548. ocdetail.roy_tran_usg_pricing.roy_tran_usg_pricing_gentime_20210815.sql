CREATE TABLE ocdetail.roy_tran_usg_pricing_gentime_20210815
        PARTITION OF ocdetail.roy_tran_usg_pricing
        FOR VALUES FROM (MINVALUE) TO ('2021-08-15 00:00:00');

