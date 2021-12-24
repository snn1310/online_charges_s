CREATE TABLE ccdetail2.transaction_usage_gentime_20210828
        PARTITION OF ccdetail2.transaction_usage
        FOR VALUES FROM ('2021-08-27 00:00:00') TO ('2021-08-28 00:00:00');

