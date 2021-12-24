CREATE TABLE ocdetail.transaction_usage_gentime_20210822
        PARTITION OF ocdetail.transaction_usage
        FOR VALUES FROM ('2021-08-21 00:00:00') TO ('2021-08-22 00:00:00');

