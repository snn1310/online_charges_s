CREATE TABLE ccdetail4.transaction_usage_gentime_20210912
        PARTITION OF ccdetail4.transaction_usage
        FOR VALUES FROM ('2021-09-11 00:00:00') TO ('2021-09-12 00:00:00');

