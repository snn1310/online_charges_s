CREATE TABLE ocdetail.transaction_usage_gentime_20210824
        PARTITION OF ocdetail.transaction_usage
        FOR VALUES FROM ('2021-08-23 00:00:00') TO ('2021-08-24 00:00:00');

