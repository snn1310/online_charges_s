CREATE TABLE ocdetail.transaction_usage_gentime_20211008
        PARTITION OF ocdetail.transaction_usage
        FOR VALUES FROM ('2021-10-07 00:00:00') TO ('2021-10-08 00:00:00');

