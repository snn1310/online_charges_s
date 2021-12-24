CREATE TABLE ocdetail.transaction_usage_gentime_20211003
        PARTITION OF ocdetail.transaction_usage
        FOR VALUES FROM ('2021-10-02 00:00:00') TO ('2021-10-03 00:00:00');

