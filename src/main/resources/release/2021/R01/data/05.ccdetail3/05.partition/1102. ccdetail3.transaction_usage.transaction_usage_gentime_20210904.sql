CREATE TABLE ccdetail3.transaction_usage_gentime_20210904
        PARTITION OF ccdetail3.transaction_usage
        FOR VALUES FROM ('2021-09-03 00:00:00') TO ('2021-09-04 00:00:00');
