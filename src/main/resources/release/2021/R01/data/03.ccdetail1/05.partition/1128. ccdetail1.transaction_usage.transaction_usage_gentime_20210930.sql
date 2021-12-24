CREATE TABLE ccdetail1.transaction_usage_gentime_20210930
        PARTITION OF ccdetail1.transaction_usage
        FOR VALUES FROM ('2021-09-29 00:00:00') TO ('2021-09-30 00:00:00');

