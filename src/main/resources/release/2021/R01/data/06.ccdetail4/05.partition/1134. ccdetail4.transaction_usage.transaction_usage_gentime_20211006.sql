CREATE TABLE ccdetail4.transaction_usage_gentime_20211006
        PARTITION OF ccdetail4.transaction_usage
        FOR VALUES FROM ('2021-10-05 00:00:00') TO ('2021-10-06 00:00:00');

