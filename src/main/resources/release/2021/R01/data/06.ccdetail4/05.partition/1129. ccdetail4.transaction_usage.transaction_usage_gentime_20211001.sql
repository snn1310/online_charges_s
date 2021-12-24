CREATE TABLE ccdetail4.transaction_usage_gentime_20211001
        PARTITION OF ccdetail4.transaction_usage
        FOR VALUES FROM ('2021-09-30 00:00:00') TO ('2021-10-01 00:00:00');

