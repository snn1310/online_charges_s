CREATE TABLE ccdetail4.transaction_usage_gentime_20210819
        PARTITION OF ccdetail4.transaction_usage
        FOR VALUES FROM ('2021-08-18 00:00:00') TO ('2021-08-19 00:00:00');

