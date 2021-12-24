CREATE TABLE ccdetail2.roy_tran_usg_pricing_gentime_20210905
        PARTITION OF ccdetail2.roy_tran_usg_pricing
        FOR VALUES FROM ('2021-09-04 00:00:00') TO ('2021-09-05 00:00:00');

