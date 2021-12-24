CREATE TABLE ccdetail1.transaction_usage_gentime_20210818
        PARTITION OF ccdetail1.transaction_usage
        FOR VALUES FROM ('2021-08-17 00:00:00') TO ('2021-08-18 00:00:00');

