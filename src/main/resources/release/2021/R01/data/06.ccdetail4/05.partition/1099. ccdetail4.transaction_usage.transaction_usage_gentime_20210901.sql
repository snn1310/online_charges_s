CREATE TABLE ccdetail4.transaction_usage_gentime_20210901
        PARTITION OF ccdetail4.transaction_usage
        FOR VALUES FROM ('2021-08-31 00:00:00') TO ('2021-09-01 00:00:00');

