CREATE TABLE ccdetail2.roy_tran_usg_pricing_gentime_20211011
        PARTITION OF ccdetail2.roy_tran_usg_pricing
        FOR VALUES FROM ('2021-10-10 00:00:00') TO ('2021-10-11 00:00:00');

