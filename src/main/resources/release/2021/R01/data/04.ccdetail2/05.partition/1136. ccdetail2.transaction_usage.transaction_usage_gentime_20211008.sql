CREATE TABLE ccdetail2.transaction_usage_gentime_20211008
        PARTITION OF ccdetail2.transaction_usage
        FOR VALUES FROM ('2021-10-07 00:00:00') TO ('2021-10-08 00:00:00');

