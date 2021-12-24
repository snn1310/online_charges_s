CREATE TABLE ccdetail1.transaction_usage_gentime_20210817
        PARTITION OF ccdetail1.transaction_usage
        FOR VALUES FROM ('2021-08-16 00:00:00') TO ('2021-08-17 00:00:00');

