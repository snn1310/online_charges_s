CREATE TABLE ccdetail3.transaction_usage_gentime_20211017
        PARTITION OF ccdetail3.transaction_usage
        FOR VALUES FROM ('2021-10-16 00:00:00') TO ('2021-10-17 00:00:00');

