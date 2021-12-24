CREATE TABLE ocdetail.transaction_usage_gentime_20210923
        PARTITION OF ocdetail.transaction_usage
        FOR VALUES FROM ('2021-09-22 00:00:00') TO ('2021-09-23 00:00:00');

