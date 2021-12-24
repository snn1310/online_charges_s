CREATE TABLE ccdetail4.transaction_usage_gentime_20210826
        PARTITION OF ccdetail4.transaction_usage
        FOR VALUES FROM ('2021-08-25 00:00:00') TO ('2021-08-26 00:00:00');

