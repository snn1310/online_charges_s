CREATE TABLE ocdetail.transaction_usage_gentime_20210817
        PARTITION OF ocdetail.transaction_usage
        FOR VALUES FROM ('2021-08-16 00:00:00') TO ('2021-08-17 00:00:00');

