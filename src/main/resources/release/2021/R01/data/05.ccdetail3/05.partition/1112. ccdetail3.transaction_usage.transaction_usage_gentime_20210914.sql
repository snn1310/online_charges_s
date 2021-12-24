CREATE TABLE ccdetail3.transaction_usage_gentime_20210914
        PARTITION OF ccdetail3.transaction_usage
        FOR VALUES FROM ('2021-09-13 00:00:00') TO ('2021-09-14 00:00:00');

