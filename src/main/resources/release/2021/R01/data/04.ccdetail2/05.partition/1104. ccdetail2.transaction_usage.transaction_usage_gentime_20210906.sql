CREATE TABLE ccdetail2.transaction_usage_gentime_20210906
        PARTITION OF ccdetail2.transaction_usage
        FOR VALUES FROM ('2021-09-05 00:00:00') TO ('2021-09-06 00:00:00');

