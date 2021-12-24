CREATE TABLE ccdetail2.royalty_tran_usage_gentime_20210818
        PARTITION OF ccdetail2.royalty_tran_usage
        FOR VALUES FROM ('2021-08-17 00:00:00') TO ('2021-08-18 00:00:00');

