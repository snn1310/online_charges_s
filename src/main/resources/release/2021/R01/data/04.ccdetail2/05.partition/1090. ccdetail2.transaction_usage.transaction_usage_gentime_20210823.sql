CREATE TABLE ccdetail2.transaction_usage_gentime_20210823
        PARTITION OF ccdetail2.transaction_usage
        FOR VALUES FROM ('2021-08-22 00:00:00') TO ('2021-08-23 00:00:00');

