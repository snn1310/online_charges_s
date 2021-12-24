CREATE TABLE ccdetail4.transaction_usage_gentime_20211014
        PARTITION OF ccdetail4.transaction_usage
        FOR VALUES FROM ('2021-10-13 00:00:00') TO ('2021-10-14 00:00:00');

