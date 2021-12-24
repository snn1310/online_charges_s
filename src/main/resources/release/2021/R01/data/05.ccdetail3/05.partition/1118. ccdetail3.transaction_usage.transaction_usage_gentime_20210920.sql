CREATE TABLE ccdetail3.transaction_usage_gentime_20210920
        PARTITION OF ccdetail3.transaction_usage
        FOR VALUES FROM ('2021-09-19 00:00:00') TO ('2021-09-20 00:00:00');

