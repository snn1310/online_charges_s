CREATE TABLE ccdetail4.transaction_usage_gentime_20210816
        PARTITION OF ccdetail4.transaction_usage
        FOR VALUES FROM ('2021-08-15 00:00:00') TO ('2021-08-16 00:00:00');

