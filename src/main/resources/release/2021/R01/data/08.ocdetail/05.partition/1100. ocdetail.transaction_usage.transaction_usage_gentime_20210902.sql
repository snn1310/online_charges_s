CREATE TABLE ocdetail.transaction_usage_gentime_20210902
        PARTITION OF ocdetail.transaction_usage
        FOR VALUES FROM ('2021-09-01 00:00:00') TO ('2021-09-02 00:00:00');

