CREATE TABLE ocdetail.transaction_usage_gentime_20210826
        PARTITION OF ocdetail.transaction_usage
        FOR VALUES FROM ('2021-08-25 00:00:00') TO ('2021-08-26 00:00:00');

