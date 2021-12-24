CREATE TABLE ccdetail3.roy_tran_usg_pricing_gentime_20210815
        PARTITION OF ccdetail3.roy_tran_usg_pricing
        FOR VALUES FROM (MINVALUE) TO ('2021-08-15 00:00:00');

