CREATE TABLE ccdetail2.transaction_usage_gentime_20211013
        PARTITION OF ccdetail2.transaction_usage
        FOR VALUES FROM ('2021-10-12 00:00:00') TO ('2021-10-13 00:00:00');

