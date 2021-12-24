CREATE TABLE ocdetail.transaction_usage_gentime_20211004
        PARTITION OF ocdetail.transaction_usage
        FOR VALUES FROM ('2021-10-03 00:00:00') TO ('2021-10-04 00:00:00');

